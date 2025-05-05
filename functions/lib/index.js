"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.sendAdminNotification = void 0;
const functions = __importStar(require("firebase-functions"));
const admin = __importStar(require("firebase-admin"));
const mail_1 = __importDefault(require("@sendgrid/mail"));
admin.initializeApp();
exports.sendAdminNotification = functions.https.onCall(async (data, context) => {
    mail_1.default.setApiKey(functions.config().sendgrid.apikey);
    const msg = {
        to: 'aymen.zch23@gmail.com',
        from: 'aymen@ziouche.dev',
        subject: 'New Ticket Created',
        text: 'A new ticket has been created.',
        html: '<strong>A new ticket has been created.</strong>',
    };
    try {
        await mail_1.default.send(msg);
        console.log("Email sent successfully");
        return { success: true, message: "Email sent successfully" };
    }
    catch (error) {
        console.error("Error sending email:", error);
        throw new functions.https.HttpsError("internal", `Error sending email: ${error}`);
    }
});
//# sourceMappingURL=index.js.map