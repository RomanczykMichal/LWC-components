import { LightningElement } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

/**
 * Displays a toast message.
 *
 * @param {Object} component - The LWC component instance (`this`).
 * @param {String} title - The title of the toast message.
 * @param {String} message - The body of the toast message.
 * @param {String} variant - The variant of the toast (e.g., 'success', 'error', 'warning', 'info').
 * @param {String} mode - The mode of the toast (e.g., 'dismissable', 'pester', 'sticky').
 */
export function showToast(
  component,
  title,
  message,
  variant = "info",
  mode = "dismissable"
) {
  const event = new ShowToastEvent({
    title,
    message,
    variant,
    mode
  });
  component.dispatchEvent(event);
}
