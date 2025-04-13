import { LightningElement } from "lwc";
import activeLanguages from "@salesforce/site/activeLanguages";
import currentLanguage from "@salesforce/i18n/lang";
import updateUserLanguage from "@salesforce/apex/LanguagePickerController.updateUserLanguage";
import { showToast } from "c/utils";

export default class LanguagePicker extends LightningElement {
  picklistOptions;
  selectedLanguage;

  async connectedCallback() {
    this.picklistOptions = activeLanguages.map((lang) => {
      return {
        label: lang.label,
        value: lang.code
      };
    });
    this.selectedLanguage = currentLanguage;
  }

  async handleLanguageChange(event) {
    this.selectedLanguage = event.detail.value;
    try {
      await updateUserLanguage({
        selectedLanguage: this.selectedLanguage
      });
      showToast(this, "Success", "Language updated successfully!", "success");
      window.location.reload();
    } catch (error) {
      console.error("Error updating language:", error);
      showToast(this, "Error", "Failed to update language.", "error");
    }
  }
}
