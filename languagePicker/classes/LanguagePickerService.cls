public with sharing class LanguagePickerService {
  /**
   * Handles the selected language and updates the user's language preference.
   *
   * @param selectedLanguage The language code selected by the user.
   */
  public static void updateUserLanguage(String selectedLanguage) {
    if (
      Schema.sObjectType.User.fields.LanguageLocaleKey.isUpdateable() &&
      Schema.sObjectType.User.isAccessible()
    ) {
      User user = [
        SELECT Id, LanguageLocaleKey
        FROM User
        WHERE Id = :UserInfo.getUserId()
      ];
      user.LanguageLocaleKey = selectedLanguage.replace('-', '_');
      update user;
    } else {
      throw new NoAccessException();
    }
  }
}
