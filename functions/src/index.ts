import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import sgMail from "@sendgrid/mail";

admin.initializeApp();



export const sendAdminNotification = functions.https.onCall(async (data, context) => {
  sgMail.setApiKey(functions.config().sendgrid.apikey);
  const msg = {
    to: 'aymen.zch23@gmail.com',
    from: 'aymen@ziouche.dev',
    subject: 'New Ticket Created',
    text: 'A new ticket has been created.',
    html: '<strong>A new ticket has been created.</strong>',
  };

  try {
    await sgMail.send(msg);
    console.log("Email sent successfully");
    return { success: true, message: "Email sent successfully" };
  } catch (error) {
    console.error("Error sending email:", error);
    throw new functions.https.HttpsError(
      "internal",
      `Error sending email: ${error}`
    );
  }
});