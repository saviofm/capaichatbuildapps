using {capaichatbuildapps as db} from '../db/schema';

@protocol: ['odata', 'rest']
service ChatService  {

    entity Conversation as projection on db.Conversation;
    entity Message      as projection on db.Message;

    type RagResponse_AdditionalContents {

        score       : String;
        pageContent : String;
    }

    type RagResponse {
        role               : String;
        content            : String;
        messageTime        : String;
        additionalContents : array of RagResponse_AdditionalContents;
    }

    action   getChatRagResponse(conversationId : String, messageId : String, message_time : Timestamp, user_id : String, user_query : String) returns RagResponse;

    action getChatRagResponseBuild(conversationId : String, messageId : String, message_time : Timestamp, user_id : String, user_query : String) returns RagResponse;
    
    function deleteChatData() returns String;
}
