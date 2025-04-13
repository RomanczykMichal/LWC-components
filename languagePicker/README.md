This repository contains a Salesforce Lightning Web Component (LWC) called `LanguagePicker`, along with its supporting Apex classes and test classes. The `LanguagePicker` component allows users to select their preferred language, which updates their Salesforce user language settings.

## Features

- **Lightning Web Component**: A user-friendly dropdown for selecting a language.
- **Apex Controller**: Handles the backend logic for updating the user's language preference.
- **Service Layer**: Encapsulates the logic for updating the user's language securely.
- **Test Coverage**: Includes comprehensive test classes for both the controller and service.


## File Structure

### LWC Files
- **`languagePicker.js`**  
  Handles the logic for the `LanguagePicker` component, including fetching available languages and updating the user's language.

- **`languagePicker.html`**  
  The HTML template for the `LanguagePicker` component, featuring a `lightning-combobox` for language selection.

- **`utils.js`**  
  A utility file for reusable functions, such as displaying toast messages.

### Apex Classes
- **`LanguagePickerController.cls`**  
  An Apex controller exposed to Lightning components. It handles the language update request and delegates the logic to the service layer.

- **`LanguagePickerService.cls`**  
  A service class that contains the core logic for updating the user's language. It ensures proper field-level security checks before performing updates.

### Test Classes
- **`LanguagePickerControllerTest.cls`**  
  A test class for `LanguagePickerController`. It includes tests for successful language updates and scenarios where the user lacks the necessary permissions.


## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/RomanczykMichal/LWC-components.git
   ```

2. Copy metadata files to your project folder.

2. Deploy the code to your Salesforce org using the Salesforce CLI:
   ```bash
   sfdx force:source:deploy -p force-app
   ```

3. Assign the `LanguagePicker` component to a Experience Cloud site.


## Usage

1. Add the `LanguagePicker` component to a Experience Cloud site using the Experience Cloud Builder.
2. The component will display a dropdown with available languages.
3. When a user selects a language, their Salesforce user language preference will be updated.


## Apex Code Details

### `LanguagePickerController.cls`
- **Method**: `updateUserLanguage(String selectedLanguage)`  
  Calls the `LanguagePickerService` to update the user's language. Handles exceptions and ensures proper error reporting.

### LanguagePickerService.cls
- **Method**: `updateUserLanguage(String selectedLanguage)`  
  Updates the `LanguageLocaleKey` field of the current user after verifying field-level security.


## LWC Details

### languagePicker.js
- Fetches the list of active languages using `@salesforce/site/activeLanguages`.
- Updates the user's language by calling the `updateUserLanguage` Apex method.

### languagePicker.html
- Displays a `lightning-combobox` for language selection.

### utils.js
- Provides a reusable `showToast` function for displaying toast messages.
