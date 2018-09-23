package com.alphasta.common.core.webapp.filter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.zip.GZIPOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * Wraps Response Stream for GZipFilter
 * 
 * @author Matt Raible
 */
public class GzipResponseStream extends ServletOutputStream {
  /**
   * abstraction of the output stream used for compression
   */
  protected OutputStream bufferedOutput = null;

  /**
   * state keeping variable for if close() has been called
   */
  protected boolean closed = false;

  /**
   * reference to original response
   */
  protected HttpServletResponse response = null;

  /**
   * reference to the output stream to the client's browser
   */
  protected ServletOutputStream output = null;

  /**
   * default size of the in-memory buffer
   */
  private int bufferSize = 50000;

  /**
   * Constructor
   * @param response reference to the output stream to the client's browser *
   */
  public GzipResponseStream(HttpServletResponse response) throws IOException {
    super();
    closed = false;
    this.response = response;
    this.output = response.getOutputStream();
    bufferedOutput = new ByteArrayOutputStream();
  }

  /**
   * Close output
   */
  @Override
  public void close() throws IOException {
    // verify the stream is yet to be closed
    if (closed) {
      throw new IOException("This output stream has already been closed");
    }

    // if we buffered everything in memory, gzip it
    if (bufferedOutput instanceof ByteArrayOutputStream) {
      // get the content
      ByteArrayOutputStream baos = (ByteArrayOutputStream) bufferedOutput;
      // prepare a gzip stream
      ByteArrayOutputStream compressedContent = new ByteArrayOutputStream();
      GZIPOutputStream gzipstream = new GZIPOutputStream(compressedContent);
      byte[] bytes = baos.toByteArray();
      gzipstream.write(bytes);
      gzipstream.finish();
      // get the compressed content
      byte[] compressedBytes = compressedContent.toByteArray();
      // set appropriate HTTP headers
      response.setContentLength(compressedBytes.length);
      response.addHeader("Content-Encoding", "gzip");
      output.write(compressedBytes);
      output.flush();
      output.close();
      closed = true;
    } else if (bufferedOutput instanceof GZIPOutputStream) {
      // if things were not buffered in memory, finish the GZIP
      // stream and response
      // cast to appropriate type
      GZIPOutputStream gzipstream = (GZIPOutputStream) bufferedOutput;

      // finish the compression
      gzipstream.finish();

      // finish the response
      output.flush();
      output.close();
      closed = true;
    }
  }
  /**
   * @see java.io.OutputStream#flush()
   */
  @Override
  public void flush() throws IOException {
    if (closed) {
      throw new IOException("Cannot flush a closed output stream");
    }

    bufferedOutput.flush();
  }
  /**
   *  @see java.io.OutputStream#write(int)
   */
  @Override
  public void write(int b) throws IOException {
    if (closed) {
      throw new IOException("Cannot write to a closed output stream");
    }

    // make sure we aren't over the buffer's limit
    checkBufferSize(1);

    // write the byte to the temporary output
    bufferedOutput.write((byte) b);
  }
  
  /**
   * check if we are buffering too large of a file
   */
  private void checkBufferSize(int length) throws IOException {
    if (bufferedOutput instanceof ByteArrayOutputStream) {
      ByteArrayOutputStream baos = (ByteArrayOutputStream) bufferedOutput;

      if ((baos.size() + length) > bufferSize) {
        // files too large to keep in memory are sent to the client without
        // Content-Length specified
        response.addHeader("Content-Encoding", "gzip");

        // get existing bytes
        byte[] bytes = baos.toByteArray();

        // make new gzip stream using the response output stream
        GZIPOutputStream gzipstream = new GZIPOutputStream(output);
        gzipstream.write(bytes);

        // we are no longer buffering, send content via gzipstream
        bufferedOutput = gzipstream;
      }
    }
  }
  /**
   *  @see java.io.OutputStream#write(byte[])
   */
  @Override
  public void write(byte[] b) throws IOException {
    write(b, 0, b.length);
  }
  /**
   *  @see java.io.OutputStream#write(byte[], int, int)
   */
  @Override
  public void write(byte[] b, int off, int len) throws IOException {

    if (closed) {
      throw new IOException("Cannot write to a closed output stream");
    }

    // make sure we aren't over the buffer's limit
    checkBufferSize(len);

    // write the content to the buffer
    bufferedOutput.write(b, off, len);
  }
  
  /**
   * @return true if OutputStream is closed.
   */
  public boolean closed() {
    return (this.closed);
  }
  /**
   * FIXME:Do nothing yet.
   */
  public void reset() {
    // noop
  }
}
