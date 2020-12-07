import * as grpc from "grpc";

import { SendEmailRequest, SendEmailResponse } from "../proto/email_pb";
import { EmailService, IEmailServer } from "../proto/email_grpc_pb";

class EmailHandler implements IEmailServer {
  /**
   * Send email
   * @param call
   * @param callback
   */
  sendEmail = (
    call: grpc.ServerUnaryCall<SendEmailRequest>,
    callback: grpc.sendUnaryData<SendEmailResponse>
  ): void => {
    const reply: SendEmailResponse = new SendEmailResponse();

    // TODO: implement NodeMailer
    reply.setDone(true);
    callback(null, reply);
  };
}

export default {
  service: EmailService, // Service interface
  handler: new EmailHandler(), // Service interface definitions
};
