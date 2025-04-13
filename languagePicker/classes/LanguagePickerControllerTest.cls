@isTest
public with sharing class LanguagePickerControllerTest {
  @TestSetup
  static void setup() {
    insert new User(
      Alias = 'standard',
      Email = 'LanguagePickerControllerTest@testuser.com',
      EmailEncodingKey = 'UTF-8',
      LastName = 'Test',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      ProfileId = [
        SELECT Id
        FROM Profile
        WHERE Name = 'Standard User'
        LIMIT 1
      ]
      .Id,
      TimeZoneSidKey = 'America/Los_Angeles',
      Username = 'LanguagePickerControllerTest@standard.com.LanguagePickerControllerTest'
    );
  }

  @isTest
  static void testUpdateUserLanguage() {
    User testUser = [SELECT Id FROM User WHERE Alias = 'standard' LIMIT 1];

    System.runAs(testUser) {
      Test.startTest();
      LanguagePickerController.updateUserLanguage('de');
      Test.stopTest();

      User updatedUser = [
        SELECT LanguageLocaleKey
        FROM User
        WHERE Id = :testUser.Id
      ];
      System.assertEquals(
        'de',
        updatedUser.LanguageLocaleKey,
        'The user language should be updated to de'
      );
    }
  }
}
