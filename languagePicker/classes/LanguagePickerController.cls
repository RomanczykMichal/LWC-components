public with sharing class LanguagePickerController {
  /**
   * Handles the selected language and updates the user's language preference.
   *
   * @param selectedLanguage The language code selected by the user.
   */
  @AuraEnabled
  public static void updateUserLanguage(String selectedLanguage) {
    try {
      LanguagePickerService.updateUserLanguage(selectedLanguage);
    } catch (Exception e) {
      throw new AuraHandledException(e.getstackTraceString());
      // Alternatively, you can log the error using NebulaLogger
      // Logger.error(e.getMessage()).parseStackTrace(e.getStackTraceString());
      // Logger.saveLog();
    }
  }
}
