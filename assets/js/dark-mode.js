(function () {
  'use strict';

  const STORAGE_KEY = 'theme';
  const DEFAULT_THEME = 'light';
  const DARK_SKIN_CLASS = 'dark-theme';

  /**
   * Đọc preference từ localStorage, fallback về default.
   * @returns {'light' | 'dark'}
   */
  function getSavedTheme() {
    try {
      return localStorage.getItem(STORAGE_KEY) || DEFAULT_THEME;
    } catch (e) {
      return DEFAULT_THEME;
    }
  }

  /**
   * Áp dụng theme lên document.
   * @param {'light' | 'dark'} theme
   */
  function applyTheme(theme) {
    if (theme === 'dark') {
      document.documentElement.setAttribute('data-theme', 'dark');
      document.body.classList.add(DARK_SKIN_CLASS);
    } else {
      document.documentElement.removeAttribute('data-theme');
      document.body.classList.remove(DARK_SKIN_CLASS);
    }
    updateToggleButton(theme);
  }

  /**
   * Cập nhật checkbox state và label.
   * @param {'light' | 'dark'} theme
   */
  function updateToggleButton(theme) {
    var checkbox = document.getElementById('dark-mode-toggle');
    if (!checkbox) return;
    checkbox.checked = (theme === 'dark');
    var label = checkbox.closest('label') || checkbox;
    label.setAttribute('aria-label', theme === 'dark' ? 'Chuyển sang Light Mode' : 'Chuyển sang Dark Mode');
  }

  /**
   * Xử lý change toggle.
   */
  function handleToggle() {
    var current = getSavedTheme();
    var next = current === 'dark' ? 'light' : 'dark';
    try {
      localStorage.setItem(STORAGE_KEY, next);
    } catch (e) {
      // localStorage không khả dụng — vẫn toggle trong session
    }
    applyTheme(next);
  }

  // ── Khởi tạo khi DOM sẵn sàng ──────────────────────────────────────
  document.addEventListener('DOMContentLoaded', function () {
    var checkbox = document.getElementById('dark-mode-toggle');
    if (checkbox) {
      checkbox.addEventListener('change', handleToggle);
    }
    applyTheme(getSavedTheme());
  });

  // Áp dụng sớm nhất có thể để tránh flash of unstyled content
  applyTheme(getSavedTheme());
})();
