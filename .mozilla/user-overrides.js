/* [SETTING] Privacy & Security>History>Custom Settings>Remember browsing and download history */
user_pref("places.history.enabled", false);

/* [SETTING] General>Startup>Restore previous session */
user_pref("browser.startup.page", 3);

user_pref("browser.contentblocking.category", "standard");

user_pref("privacy.resistFingerprinting", false);
user_pref("privacy.resistFingerprinting.letterboxing", false);
user_pref("browser.display.use_system_colors", true);

user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false); // [FF128+] [DEFAULT: true]

user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false); // Cookies, Site Data, Active Logins [FF128+]

user_pref("privacy.clearOnShutdown.sessions", false);  // Active Logins [DEFAULT: true]