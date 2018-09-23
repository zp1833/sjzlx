package com.alphasta.common.security.user.service.listener;

import com.alphasta.common.security.acegi.cache.AcegiCacheManager;
import com.alphasta.common.security.user.model.User;

/**
 * 修改或删除用户的时候，同步缓存的监听器
 * @author Sam Lee
 *
 */
public class AcegiCacheSyncListener implements UserChangeListener {
  /**
   * <code>AcegiCacheManager</code>用于同步缓存
   */
  private AcegiCacheManager acegiCacheManager;
  
  public void setAcegiCacheManager(AcegiCacheManager acegiCacheManager) {
    this.acegiCacheManager = acegiCacheManager;
  }
  /**
   * @see UserChangeListener#onRemove(User)
   */
  public void onRemove(User user) {
    // 同步缓存
    if (acegiCacheManager != null) {
      acegiCacheManager.onUserChanged(null, user.getUsername());
    }
  }
  
  /**
   * @see UserChangeListener#onSave(User, User)
   */
  public void onSave(User newUser, User oldUser) {
    if (acegiCacheManager != null) {
      acegiCacheManager.onUserChanged(newUser, oldUser.getUsername());
    }
  }

}
