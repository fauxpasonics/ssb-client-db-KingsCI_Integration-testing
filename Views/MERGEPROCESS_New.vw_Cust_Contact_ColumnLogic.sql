SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [MERGEPROCESS_New].[vw_Cust_Contact_ColumnLogic]
AS

SELECT 	
COALESCE(winner.Account_Name_for_Export__c,loser.Account_Name_for_Export__c)	 AS [Account_Name_for_Export__c]
,COALESCE(NULLIF(winner.Account_Owner__c,''),NULLIF(loser.Account_Owner__c,''))	 AS [Account_Owner__c]
,COALESCE(NULLIF(winner.Account_Owner_ID__c,''),NULLIF(loser.Account_Owner_ID__c,''))	 AS [Account_Owner_ID__c]
,COALESCE(winner.Account_Record_Type__c,loser.Account_Record_Type__c)	 AS [Account_Record_Type__c]
,COALESCE(winner.Account_Temp_Field__c,loser.Account_Temp_Field__c)	 AS [Account_Temp_Field__c]
,COALESCE(NULLIF(winner.Account_Type__c,''),NULLIF(loser.Account_Type__c,''))	 AS [Account_Type__c]
,COALESCE(winner.ActiveRep__c,loser.ActiveRep__c)	 AS [ActiveRep__c]
,COALESCE(winner.Adults_In_Household__c,loser.Adults_In_Household__c)	 AS [Adults_In_Household__c]
,COALESCE(NULLIF(winner.Alternate_Email__c,''),NULLIF(loser.Alternate_Email__c,''))	 AS [Alternate_Email__c]
,COALESCE(NULLIF(winner.Anniversary_Date__c,''),NULLIF(loser.Anniversary_Date__c,''))	 AS [Anniversary_Date__c]
,COALESCE(winner.Annual_Revenue__c,loser.Annual_Revenue__c)	 AS [Annual_Revenue__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_action_required__c,''),NULLIF(loser.AVA__AVAAI_action_required__c,''))	 AS [AVA__AVAAI_action_required__c]
,COALESCE(winner.AVA__AVAAI_action_required_date__c,loser.AVA__AVAAI_action_required_date__c)	 AS [AVA__AVAAI_action_required_date__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_confirmed_phone_1__c,''),NULLIF(loser.AVA__AVAAI_confirmed_phone_1__c,''))	 AS [AVA__AVAAI_confirmed_phone_1__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_confirmed_phone_2__c,''),NULLIF(loser.AVA__AVAAI_confirmed_phone_2__c,''))	 AS [AVA__AVAAI_confirmed_phone_2__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_conversation_stage__c,''),NULLIF(loser.AVA__AVAAI_conversation_stage__c,''))	 AS [AVA__AVAAI_conversation_stage__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_conversation_stage_date__c,''),NULLIF(loser.AVA__AVAAI_conversation_stage_date__c,''))	 AS [AVA__AVAAI_conversation_stage_date__c]
,COALESCE(winner.AVA__AVAAI_conversation_status__c,loser.AVA__AVAAI_conversation_status__c)	 AS [AVA__AVAAI_conversation_status__c]
,COALESCE(winner.AVA__AVAAI_conversation_status_date__c,loser.AVA__AVAAI_conversation_status_date__c)	 AS [AVA__AVAAI_conversation_status_date__c]
,COALESCE(winner.AVA__AVAAI_conversation_status_detail__c,loser.AVA__AVAAI_conversation_status_detail__c)	 AS [AVA__AVAAI_conversation_status_detail__c]
,COALESCE(winner.AVA__AVAAI_conversation_status_detail_date__c,loser.AVA__AVAAI_conversation_status_detail_date__c)	 AS [AVA__AVAAI_conversation_status_detail_date__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_conversica_lead_status__c,''),NULLIF(loser.AVA__AVAAI_conversica_lead_status__c,''))	 AS [AVA__AVAAI_conversica_lead_status__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_conversica_lead_status_date__c,''),NULLIF(loser.AVA__AVAAI_conversica_lead_status_date__c,''))	 AS [AVA__AVAAI_conversica_lead_status_date__c]
,COALESCE(winner.AVA__AVAAI_date_added__c,loser.AVA__AVAAI_date_added__c)	 AS [AVA__AVAAI_date_added__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_first_message_date__c,''),NULLIF(loser.AVA__AVAAI_first_message_date__c,''))	 AS [AVA__AVAAI_first_message_date__c]
,COALESCE(winner.AVA__AVAAI_hot_lead__c,loser.AVA__AVAAI_hot_lead__c)	 AS [AVA__AVAAI_hot_lead__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_hot_lead_date__c,''),NULLIF(loser.AVA__AVAAI_hot_lead_date__c,''))	 AS [AVA__AVAAI_hot_lead_date__c]
,COALESCE(winner.AVA__AVAAI_last_message_date__c,loser.AVA__AVAAI_last_message_date__c)	 AS [AVA__AVAAI_last_message_date__c]
,COALESCE(winner.AVA__AVAAI_last_response_date__c,loser.AVA__AVAAI_last_response_date__c)	 AS [AVA__AVAAI_last_response_date__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_lead_at_risk__c,''),NULLIF(loser.AVA__AVAAI_lead_at_risk__c,''))	 AS [AVA__AVAAI_lead_at_risk__c]
,COALESCE(winner.AVA__AVAAI_lead_at_risk_date__c,loser.AVA__AVAAI_lead_at_risk_date__c)	 AS [AVA__AVAAI_lead_at_risk_date__c]
,COALESCE(winner.AVA__AVAAI_options__c,loser.AVA__AVAAI_options__c)	 AS [AVA__AVAAI_options__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_score__c,''),NULLIF(loser.AVA__AVAAI_score__c,''))	 AS [AVA__AVAAI_score__c]
,COALESCE(NULLIF(winner.AVA__AVAAI_status__c,''),NULLIF(loser.AVA__AVAAI_status__c,''))	 AS [AVA__AVAAI_status__c]
,COALESCE(winner.Change_Owner_Date__c,loser.Change_Owner_Date__c)	 AS [Change_Owner_Date__c]
,COALESCE(NULLIF(winner.Child_1_Age__c,''),NULLIF(loser.Child_1_Age__c,''))	 AS [Child_1_Age__c]
,COALESCE(winner.Child_1_Name__c,loser.Child_1_Name__c)	 AS [Child_1_Name__c]
,COALESCE(winner.Child_2_Age__c,loser.Child_2_Age__c)	 AS [Child_2_Age__c]
,COALESCE(NULLIF(winner.Child_2_Name__c,''),NULLIF(loser.Child_2_Name__c,''))	 AS [Child_2_Name__c]
,COALESCE(NULLIF(winner.Child_3_Age__c,''),NULLIF(loser.Child_3_Age__c,''))	 AS [Child_3_Age__c]
,COALESCE(NULLIF(winner.Child_3_Name__c,''),NULLIF(loser.Child_3_Name__c,''))	 AS [Child_3_Name__c]
,COALESCE(winner.Children_Flag__c,loser.Children_Flag__c)	 AS [Children_Flag__c]
,COALESCE(winner.CleanStatus,loser.CleanStatus)	 AS [CleanStatus]
,COALESCE(winner.Contact_ID_18_Char__c,loser.Contact_ID_18_Char__c)	 AS [Contact_ID_18_Char__c]
,COALESCE(NULLIF(winner.Contact_Type__c,''),NULLIF(loser.Contact_Type__c,''))	 AS [Contact_Type__c]
,COALESCE(NULLIF(winner.Conversica_Campaign_Temp_Field__c,''),NULLIF(loser.Conversica_Campaign_Temp_Field__c,''))	 AS [Conversica_Campaign_Temp_Field__c]
,COALESCE(winner.Converted_Account_Name__c,loser.Converted_Account_Name__c)	 AS [Converted_Account_Name__c]
,COALESCE(winner.CreatedById,loser.CreatedById)	 AS [CreatedById]
,COALESCE(winner.CreatedDate,loser.CreatedDate)	 AS [CreatedDate]
,COALESCE(NULLIF(winner.Current_Partner_Contact__c,''),NULLIF(loser.Current_Partner_Contact__c,''))	 AS [Current_Partner_Contact__c]
,COALESCE(NULLIF(winner.Date_of_Halftime_Event__c,''),NULLIF(loser.Date_of_Halftime_Event__c,''))	 AS [Date_of_Halftime_Event__c]
,COALESCE(NULLIF(winner.Department,''),NULLIF(loser.Department,''))	 AS [Department]
,COALESCE(NULLIF(winner.Description,''),NULLIF(loser.Description,''))	 AS [Description]
,COALESCE(NULLIF(winner.DialSource__Datetime_of_Last_Disposition_DS__c,''),NULLIF(loser.DialSource__Datetime_of_Last_Disposition_DS__c,''))	 AS [DialSource__Datetime_of_Last_Disposition_DS__c]
,COALESCE(NULLIF(winner.DialSource__DS_Owner_ID__c,''),NULLIF(loser.DialSource__DS_Owner_ID__c,''))	 AS [DialSource__DS_Owner_ID__c]
,COALESCE(winner.DialSource__Last_Call_Campaign_Name__c,loser.DialSource__Last_Call_Campaign_Name__c)	 AS [DialSource__Last_Call_Campaign_Name__c]
,COALESCE(winner.DialSource__Last_Disposition_DS__c,loser.DialSource__Last_Disposition_DS__c)	 AS [DialSource__Last_Disposition_DS__c]
,COALESCE(NULLIF(winner.DialSource__Next_Call_DS__c,''),NULLIF(loser.DialSource__Next_Call_DS__c,''))	 AS [DialSource__Next_Call_DS__c]
,COALESCE(NULLIF(winner.DialSource__Total_Call_Count_DS__c,''),NULLIF(loser.DialSource__Total_Call_Count_DS__c,''))	 AS [DialSource__Total_Call_Count_DS__c]
,COALESCE(NULLIF(winner.Discretionary_Income__c,''),NULLIF(loser.Discretionary_Income__c,''))	 AS [Discretionary_Income__c]
,COALESCE(winner.Distance_from_Golden_1_Center_Miles__c,loser.Distance_from_Golden_1_Center_Miles__c)	 AS [Distance_from_Golden_1_Center_Miles__c]
,COALESCE(NULLIF(winner.DoNotCall,''),NULLIF(loser.DoNotCall,''))	 AS [DoNotCall]
,COALESCE(winner.DS_Activity_Type__c,loser.DS_Activity_Type__c)	 AS [DS_Activity_Type__c]
,COALESCE(NULLIF(winner.DS_Amount__c,''),NULLIF(loser.DS_Amount__c,''))	 AS [DS_Amount__c]
,COALESCE(winner.DS_Bighorns_Closed_Lost_Reason__c,loser.DS_Bighorns_Closed_Lost_Reason__c)	 AS [DS_Bighorns_Closed_Lost_Reason__c]
,COALESCE(winner.DS_Bighorns_Opp_Type__c,loser.DS_Bighorns_Opp_Type__c)	 AS [DS_Bighorns_Opp_Type__c]
,COALESCE(NULLIF(winner.DS_Closed_Lost_Reason__c,''),NULLIF(loser.DS_Closed_Lost_Reason__c,''))	 AS [DS_Closed_Lost_Reason__c]
,COALESCE(winner.DS_Date_of_Last_Dispo__c,loser.DS_Date_of_Last_Dispo__c)	 AS [DS_Date_of_Last_Dispo__c]
,COALESCE(winner.DS_Follow_Up_Task__c,loser.DS_Follow_Up_Task__c)	 AS [DS_Follow_Up_Task__c]
,COALESCE(winner.DS_Inbound_Group__c,loser.DS_Inbound_Group__c)	 AS [DS_Inbound_Group__c]
,COALESCE(NULLIF(winner.DS_Inbound_Picklist__c,''),NULLIF(loser.DS_Inbound_Picklist__c,''))	 AS [DS_Inbound_Picklist__c]
,COALESCE(NULLIF(winner.DS_Last_Call_List_Name__c,''),NULLIF(loser.DS_Last_Call_List_Name__c,''))	 AS [DS_Last_Call_List_Name__c]
,COALESCE(winner.DS_Last_Disposition__c,loser.DS_Last_Disposition__c)	 AS [DS_Last_Disposition__c]
,COALESCE(winner.DS_Phone__c,loser.DS_Phone__c)	 AS [DS_Phone__c]
,COALESCE(NULLIF(winner.DS_Prospect_Game_Ticket_Request__c,''),NULLIF(loser.DS_Prospect_Game_Ticket_Request__c,''))	 AS [DS_Prospect_Game_Ticket_Request__c]
,COALESCE(NULLIF(winner.DS_Prospect_Ticket__c,''),NULLIF(loser.DS_Prospect_Ticket__c,''))	 AS [DS_Prospect_Ticket__c]
,COALESCE(NULLIF(winner.DS_Prospect_Ticket_Date__c,''),NULLIF(loser.DS_Prospect_Ticket_Date__c,''))	 AS [DS_Prospect_Ticket_Date__c]
,COALESCE(NULLIF(winner.DS_Prospect_Ticket_Type_of_Product__c,''),NULLIF(loser.DS_Prospect_Ticket_Type_of_Product__c,''))	 AS [DS_Prospect_Ticket_Type_of_Product__c]
,COALESCE(NULLIF(winner.DS_Quantity__c,''),NULLIF(loser.DS_Quantity__c,''))	 AS [DS_Quantity__c]
,COALESCE(NULLIF(winner.DS_Sales_Event_2__c,''),NULLIF(loser.DS_Sales_Event_2__c,''))	 AS [DS_Sales_Event_2__c]
,COALESCE(winner.DS_Sales_Event_Date_2__c,loser.DS_Sales_Event_Date_2__c)	 AS [DS_Sales_Event_Date_2__c]
,COALESCE(winner.DS_Set_Meeting_Date__c,loser.DS_Set_Meeting_Date__c)	 AS [DS_Set_Meeting_Date__c]
,COALESCE(NULLIF(winner.DS_Total_Call_Count__c,''),NULLIF(loser.DS_Total_Call_Count__c,''))	 AS [DS_Total_Call_Count__c]
,COALESCE(NULLIF(winner.EmailBouncedDate,''),NULLIF(loser.EmailBouncedDate,''))	 AS [EmailBouncedDate]
,COALESCE(NULLIF(winner.EmailBouncedReason,''),NULLIF(loser.EmailBouncedReason,''))	 AS [EmailBouncedReason]
,COALESCE(NULLIF(winner.Employer__c,''),NULLIF(loser.Employer__c,''))	 AS [Employer__c]
,COALESCE(winner.ESC_Web_View_Last_15_Days__c,loser.ESC_Web_View_Last_15_Days__c)	 AS [ESC_Web_View_Last_15_Days__c]
,COALESCE(winner.Favorite_Current_Kings_Player__c,loser.Favorite_Current_Kings_Player__c)	 AS [Favorite_Current_Kings_Player__c]
,COALESCE(winner.FICO_Score__c,loser.FICO_Score__c)	 AS [FICO_Score__c]
,COALESCE(winner.G1C_Web_View_Last_15_Days__c,loser.G1C_Web_View_Last_15_Days__c)	 AS [G1C_Web_View_Last_15_Days__c]
,COALESCE(NULLIF(winner.Games_Personally_Attended__c,''),NULLIF(loser.Games_Personally_Attended__c,''))	 AS [Games_Personally_Attended__c]
,COALESCE(NULLIF(winner.Group_Events_Previous_Season__c,''),NULLIF(loser.Group_Events_Previous_Season__c,''))	 AS [Group_Events_Previous_Season__c]
,COALESCE(winner.Halftime_Event__c,loser.Halftime_Event__c)	 AS [Halftime_Event__c]
,COALESCE(winner.Halftime_Event_Temp_Field__c,loser.Halftime_Event_Temp_Field__c)	 AS [Halftime_Event_Temp_Field__c]
,COALESCE(NULLIF(winner.HasOptedOutOfEmail,''),NULLIF(loser.HasOptedOutOfEmail,''))	 AS [HasOptedOutOfEmail]
,COALESCE(NULLIF(winner.Household_Income__c,''),NULLIF(loser.Household_Income__c,''))	 AS [Household_Income__c]
,COALESCE(NULLIF(winner.Inactive_Contact__c,''),NULLIF(loser.Inactive_Contact__c,''))	 AS [Inactive_Contact__c]
,COALESCE(NULLIF(winner.Inactive_Description__c,''),NULLIF(loser.Inactive_Description__c,''))	 AS [Inactive_Description__c]
,COALESCE(NULLIF(winner.Inactive_Reason__c,''),NULLIF(loser.Inactive_Reason__c,''))	 AS [Inactive_Reason__c]
,COALESCE(NULLIF(winner.IsDeleted,''),NULLIF(loser.IsDeleted,''))	 AS [IsDeleted]
,COALESCE(NULLIF(winner.IsEmailBounced,''),NULLIF(loser.IsEmailBounced,''))	 AS [IsEmailBounced]
,COALESCE(NULLIF(winner.Jigsaw,''),NULLIF(loser.Jigsaw,''))	 AS [Jigsaw]
,COALESCE(winner.JigsawContactId,loser.JigsawContactId)	 AS [JigsawContactId]
,COALESCE(winner.Kings_App_Profile_Picture__c,loser.Kings_App_Profile_Picture__c)	 AS [Kings_App_Profile_Picture__c]
,COALESCE(winner.koreps__Account_Stripped_Name__c,loser.koreps__Account_Stripped_Name__c)	 AS [koreps__Account_Stripped_Name__c]
,COALESCE(NULLIF(winner.koreps__Alma_Mater_College__c,''),NULLIF(loser.koreps__Alma_Mater_College__c,''))	 AS [koreps__Alma_Mater_College__c]
,COALESCE(NULLIF(winner.koreps__Archtics_IDs__c,''),NULLIF(loser.koreps__Archtics_IDs__c,''))	 AS [koreps__Archtics_IDs__c]
,COALESCE(winner.koreps__Checked_Out_By__c,loser.koreps__Checked_Out_By__c)	 AS [koreps__Checked_Out_By__c]
,COALESCE(winner.koreps__Checked_Out_Until__c,loser.koreps__Checked_Out_Until__c)	 AS [koreps__Checked_Out_Until__c]
,COALESCE(winner.koreps__Company_Id__c,loser.koreps__Company_Id__c)	 AS [koreps__Company_Id__c]
,COALESCE(NULLIF(winner.koreps__Contact_Type__c,''),NULLIF(loser.koreps__Contact_Type__c,''))	 AS [koreps__Contact_Type__c]
,COALESCE(NULLIF(winner.koreps__Disable_Contact_Sync__c,''),NULLIF(loser.koreps__Disable_Contact_Sync__c,''))	 AS [koreps__Disable_Contact_Sync__c]
,COALESCE(NULLIF(winner.koreps__External_Contact_Id__c,''),NULLIF(loser.koreps__External_Contact_Id__c,''))	 AS [koreps__External_Contact_Id__c]
,COALESCE(NULLIF(winner.koreps__Facebook_Page__c,''),NULLIF(loser.koreps__Facebook_Page__c,''))	 AS [koreps__Facebook_Page__c]
,COALESCE(NULLIF(winner.koreps__Favorite_Arena_Food__c,''),NULLIF(loser.koreps__Favorite_Arena_Food__c,''))	 AS [koreps__Favorite_Arena_Food__c]
,COALESCE(winner.koreps__Favorite_Beverage__c,loser.koreps__Favorite_Beverage__c)	 AS [koreps__Favorite_Beverage__c]
,COALESCE(NULLIF(winner.koreps__Favorite_Music__c,''),NULLIF(loser.koreps__Favorite_Music__c,''))	 AS [koreps__Favorite_Music__c]
,COALESCE(NULLIF(winner.koreps__Favorite_Opponent__c,''),NULLIF(loser.koreps__Favorite_Opponent__c,''))	 AS [koreps__Favorite_Opponent__c]
,COALESCE(NULLIF(winner.koreps__Favorite_Player__c,''),NULLIF(loser.koreps__Favorite_Player__c,''))	 AS [koreps__Favorite_Player__c]
,COALESCE(NULLIF(winner.koreps__Favorite_Team_Legend__c,''),NULLIF(loser.koreps__Favorite_Team_Legend__c,''))	 AS [koreps__Favorite_Team_Legend__c]
,COALESCE(winner.koreps__FICO_Score__c,loser.koreps__FICO_Score__c)	 AS [koreps__FICO_Score__c]
,COALESCE(winner.koreps__Gender__c,loser.koreps__Gender__c)	 AS [koreps__Gender__c]
,COALESCE(NULLIF(winner.koreps__Grandchildren_Birthday__c,''),NULLIF(loser.koreps__Grandchildren_Birthday__c,''))	 AS [koreps__Grandchildren_Birthday__c]
,COALESCE(NULLIF(winner.koreps__Grandchildren_Interests__c,''),NULLIF(loser.koreps__Grandchildren_Interests__c,''))	 AS [koreps__Grandchildren_Interests__c]
,COALESCE(winner.koreps__Grandchildren_Names__c,loser.koreps__Grandchildren_Names__c)	 AS [koreps__Grandchildren_Names__c]
,COALESCE(NULLIF(winner.koreps__Grandchildren_Other__c,''),NULLIF(loser.koreps__Grandchildren_Other__c,''))	 AS [koreps__Grandchildren_Other__c]
,COALESCE(winner.koreps__Group_Buyer__c,loser.koreps__Group_Buyer__c)	 AS [koreps__Group_Buyer__c]
,COALESCE(NULLIF(winner.koreps__Group_Category__c,''),NULLIF(loser.koreps__Group_Category__c,''))	 AS [koreps__Group_Category__c]
,COALESCE(winner.koreps__Group_Sales_Rep__c,loser.koreps__Group_Sales_Rep__c)	 AS [koreps__Group_Sales_Rep__c]
,COALESCE(winner.koreps__Heritage_Nationality__c,loser.koreps__Heritage_Nationality__c)	 AS [koreps__Heritage_Nationality__c]
,COALESCE(winner.koreps__Highlight_Memory__c,loser.koreps__Highlight_Memory__c)	 AS [koreps__Highlight_Memory__c]
,COALESCE(NULLIF(winner.koreps__Hobbies__c,''),NULLIF(loser.koreps__Hobbies__c,''))	 AS [koreps__Hobbies__c]
,COALESCE(NULLIF(winner.koreps__Instagram_Page__c,''),NULLIF(loser.koreps__Instagram_Page__c,''))	 AS [koreps__Instagram_Page__c]
,COALESCE(winner.koreps__Invalid_Email__c,loser.koreps__Invalid_Email__c)	 AS [koreps__Invalid_Email__c]
,COALESCE(NULLIF(winner.koreps__Kid_s_Interests__c,''),NULLIF(loser.koreps__Kid_s_Interests__c,''))	 AS [koreps__Kid_s_Interests__c]
,COALESCE(winner.koreps__Kids_Birthday__c,loser.koreps__Kids_Birthday__c)	 AS [koreps__Kids_Birthday__c]
,COALESCE(NULLIF(winner.koreps__Kids_Names__c,''),NULLIF(loser.koreps__Kids_Names__c,''))	 AS [koreps__Kids_Names__c]
,COALESCE(NULLIF(winner.koreps__Kids_Other__c,''),NULLIF(loser.koreps__Kids_Other__c,''))	 AS [koreps__Kids_Other__c]
,COALESCE(winner.koreps__kore_milesfromfacility__c,loser.koreps__kore_milesfromfacility__c)	 AS [koreps__kore_milesfromfacility__c]
,COALESCE(winner.koreps__kore_ticketingContactType__c,loser.koreps__kore_ticketingContactType__c)	 AS [koreps__kore_ticketingContactType__c]
,COALESCE(winner.koreps__Languages__c,loser.koreps__Languages__c)	 AS [koreps__Languages__c]
,COALESCE(winner.koreps__Level__c,loser.koreps__Level__c)	 AS [koreps__Level__c]
,COALESCE(NULLIF(winner.koreps__Marital_Status__c,''),NULLIF(loser.koreps__Marital_Status__c,''))	 AS [koreps__Marital_Status__c]
,COALESCE(NULLIF(winner.koreps__Method_of_Travel_To_Game__c,''),NULLIF(loser.koreps__Method_of_Travel_To_Game__c,''))	 AS [koreps__Method_of_Travel_To_Game__c]
,COALESCE(winner.koreps__Mini_Plan_Holder__c,loser.koreps__Mini_Plan_Holder__c)	 AS [koreps__Mini_Plan_Holder__c]
,COALESCE(winner.koreps__Niece_Nephew_Other_Birthday__c,loser.koreps__Niece_Nephew_Other_Birthday__c)	 AS [koreps__Niece_Nephew_Other_Birthday__c]
,COALESCE(winner.koreps__Niece_Nephew_Other_Interests__c,loser.koreps__Niece_Nephew_Other_Interests__c)	 AS [koreps__Niece_Nephew_Other_Interests__c]
,COALESCE(winner.koreps__Niece_Nephew_Other_Name_s__c,loser.koreps__Niece_Nephew_Other_Name_s__c)	 AS [koreps__Niece_Nephew_Other_Name_s__c]
,COALESCE(winner.koreps__Normally_Attends_Games_With__c,loser.koreps__Normally_Attends_Games_With__c)	 AS [koreps__Normally_Attends_Games_With__c]
,COALESCE(winner.koreps__Number_Of_Kids__c,loser.koreps__Number_Of_Kids__c)	 AS [koreps__Number_Of_Kids__c]
,COALESCE(winner.koreps__Other_Favorite_Sports_Teams__c,loser.koreps__Other_Favorite_Sports_Teams__c)	 AS [koreps__Other_Favorite_Sports_Teams__c]
,COALESCE(winner.koreps__Other_Sport_STH__c,loser.koreps__Other_Sport_STH__c)	 AS [koreps__Other_Sport_STH__c]
,COALESCE(winner.koreps__Override_Checkout_Expiration__c,loser.koreps__Override_Checkout_Expiration__c)	 AS [koreps__Override_Checkout_Expiration__c]
,COALESCE(winner.koreps__Photo_Location__c,loser.koreps__Photo_Location__c)	 AS [koreps__Photo_Location__c]
,COALESCE(NULLIF(winner.koreps__Primary_Archtics_Id__c,''),NULLIF(loser.koreps__Primary_Archtics_Id__c,''))	 AS [koreps__Primary_Archtics_Id__c]
,COALESCE(NULLIF(winner.koreps__Season_Ticket_Holder__c,''),NULLIF(loser.koreps__Season_Ticket_Holder__c,''))	 AS [koreps__Season_Ticket_Holder__c]
,COALESCE(winner.koreps__Secondary_Archtics_Name__c,loser.koreps__Secondary_Archtics_Name__c)	 AS [koreps__Secondary_Archtics_Name__c]
,COALESCE(NULLIF(winner.koreps__Secondary_Email__c,''),NULLIF(loser.koreps__Secondary_Email__c,''))	 AS [koreps__Secondary_Email__c]
,COALESCE(NULLIF(winner.koreps__Share_Partner__c,''),NULLIF(loser.koreps__Share_Partner__c,''))	 AS [koreps__Share_Partner__c]
,COALESCE(NULLIF(winner.koreps__Share_Partners__c,''),NULLIF(loser.koreps__Share_Partners__c,''))	 AS [koreps__Share_Partners__c]
,COALESCE(NULLIF(winner.koreps__Shirt_Size__c,''),NULLIF(loser.koreps__Shirt_Size__c,''))	 AS [koreps__Shirt_Size__c]
,COALESCE(NULLIF(winner.koreps__Source__c,''),NULLIF(loser.koreps__Source__c,''))	 AS [koreps__Source__c]
,COALESCE(NULLIF(winner.koreps__Spouse_Birthday__c,''),NULLIF(loser.koreps__Spouse_Birthday__c,''))	 AS [koreps__Spouse_Birthday__c]
,COALESCE(winner.koreps__Spouse_Name__c,loser.koreps__Spouse_Name__c)	 AS [koreps__Spouse_Name__c]
,COALESCE(NULLIF(winner.koreps__Suite_Buyer__c,''),NULLIF(loser.koreps__Suite_Buyer__c,''))	 AS [koreps__Suite_Buyer__c]
,COALESCE(NULLIF(winner.koreps__Suites_Sales_Rep__c,''),NULLIF(loser.koreps__Suites_Sales_Rep__c,''))	 AS [koreps__Suites_Sales_Rep__c]
,COALESCE(NULLIF(winner.koreps__SyncPriority__c,''),NULLIF(loser.koreps__SyncPriority__c,''))	 AS [koreps__SyncPriority__c]
,COALESCE(NULLIF(winner.koreps__Ticket_Use__c,''),NULLIF(loser.koreps__Ticket_Use__c,''))	 AS [koreps__Ticket_Use__c]
,COALESCE(NULLIF(winner.koreps__Ticketing_Account_Type__c,''),NULLIF(loser.koreps__Ticketing_Account_Type__c,''))	 AS [koreps__Ticketing_Account_Type__c]
,COALESCE(winner.koreps__Ticketing_Sales_Rep__c,loser.koreps__Ticketing_Sales_Rep__c)	 AS [koreps__Ticketing_Sales_Rep__c]
,COALESCE(winner.koreps__Ticketing_Service_Rep__c,loser.koreps__Ticketing_Service_Rep__c)	 AS [koreps__Ticketing_Service_Rep__c]
,COALESCE(winner.koreps__Twitter_Handle__c,loser.koreps__Twitter_Handle__c)	 AS [koreps__Twitter_Handle__c]
,COALESCE(winner.koreps__Use_Of_Unused_Tickets__c,loser.koreps__Use_Of_Unused_Tickets__c)	 AS [koreps__Use_Of_Unused_Tickets__c]
,COALESCE(NULLIF(winner.LastActivityDate,''),NULLIF(loser.LastActivityDate,''))	 AS [LastActivityDate]
,COALESCE(NULLIF(winner.LastCURequestDate,''),NULLIF(loser.LastCURequestDate,''))	 AS [LastCURequestDate]
,COALESCE(NULLIF(winner.LastCUUpdateDate,''),NULLIF(loser.LastCUUpdateDate,''))	 AS [LastCUUpdateDate]
,COALESCE(NULLIF(winner.LastModifiedById,''),NULLIF(loser.LastModifiedById,''))	 AS [LastModifiedById]
,COALESCE(winner.LastModifiedDate,loser.LastModifiedDate)	 AS [LastModifiedDate]
,COALESCE(winner.LastReferencedDate,loser.LastReferencedDate)	 AS [LastReferencedDate]
,COALESCE(NULLIF(winner.LastViewedDate,''),NULLIF(loser.LastViewedDate,''))	 AS [LastViewedDate]
,COALESCE(NULLIF(winner.LID__LinkedIn_Company_Id__c,''),NULLIF(loser.LID__LinkedIn_Company_Id__c,''))	 AS [LID__LinkedIn_Company_Id__c]
,COALESCE(NULLIF(winner.LID__LinkedIn_Member_Token__c,''),NULLIF(loser.LID__LinkedIn_Member_Token__c,''))	 AS [LID__LinkedIn_Member_Token__c]
,COALESCE(NULLIF(winner.Linked_Member_Token__c,''),NULLIF(loser.Linked_Member_Token__c,''))	 AS [Linked_Member_Token__c]
,COALESCE(winner.LinkedIn_Company_Id__c,loser.LinkedIn_Company_Id__c)	 AS [LinkedIn_Company_Id__c]
,COALESCE(winner.loaddate,loser.loaddate)	 AS [loaddate]
,COALESCE(winner.Location__c,loser.Location__c)	 AS [Location__c]
,COALESCE(NULLIF(winner.Log_a_Call_Contact__c,''),NULLIF(loser.Log_a_Call_Contact__c,''))	 AS [Log_a_Call_Contact__c]
,COALESCE(NULLIF(winner.MailingAddress,''),NULLIF(loser.MailingAddress,''))	 AS [MailingAddress]
,COALESCE(winner.MailingGeocodeAccuracy,loser.MailingGeocodeAccuracy)	 AS [MailingGeocodeAccuracy]
,COALESCE(NULLIF(winner.MailingLatitude,''),NULLIF(loser.MailingLatitude,''))	 AS [MailingLatitude]
,COALESCE(NULLIF(winner.MailingLongitude,''),NULLIF(loser.MailingLongitude,''))	 AS [MailingLongitude]
,COALESCE(NULLIF(winner.MasterRecordId,''),NULLIF(loser.MasterRecordId,''))	 AS [MasterRecordId]
,COALESCE(NULLIF(winner.MiddleName,''),NULLIF(loser.MiddleName,''))	 AS [MiddleName]
,COALESCE(winner.Name,loser.Name)	 AS [Name]
,COALESCE(winner.Net_Worth__c,loser.Net_Worth__c)	 AS [Net_Worth__c]
,COALESCE(winner.New_Fulls_Lead_Score__c,loser.New_Fulls_Lead_Score__c)	 AS [New_Fulls_Lead_Score__c]
,COALESCE(NULLIF(winner.Not_Interested_Date__c,''),NULLIF(loser.Not_Interested_Date__c,''))	 AS [Not_Interested_Date__c]
,COALESCE(NULLIF(winner.Not_Interested_in__c,''),NULLIF(loser.Not_Interested_in__c,''))	 AS [Not_Interested_in__c]
,COALESCE(NULLIF(winner.Not_Interested_Reason__c,''),NULLIF(loser.Not_Interested_Reason__c,''))	 AS [Not_Interested_Reason__c]
,COALESCE(winner.Opponent__c,loser.Opponent__c)	 AS [Opponent__c]
,COALESCE(winner.Owner_Sales_Team__c,loser.Owner_Sales_Team__c)	 AS [Owner_Sales_Team__c]
--,COALESCE(NULLIF(winner.OwnerId,''),NULLIF(loser.OwnerId,''))	 AS [OwnerId]
,CASE WHEN winner.OwnerId = '00536000002hODKAA2' AND loser.OwnerId <>'00536000002hODKAA2' THEN loser.OwnerId ELSE winner.OwnerId END  AS [OwnerID]
,COALESCE(NULLIF(winner.Partner_Contact__c,''),NULLIF(loser.Partner_Contact__c,''))	 AS [Partner_Contact__c]
,COALESCE(NULLIF(winner.Past_Current_Buyer_Type_2014__c,''),NULLIF(loser.Past_Current_Buyer_Type_2014__c,''))	 AS [Past_Current_Buyer_Type_2014__c]
,COALESCE(NULLIF(winner.Past_Current_Buyer_Type_2015__c,''),NULLIF(loser.Past_Current_Buyer_Type_2015__c,''))	 AS [Past_Current_Buyer_Type_2015__c]
,COALESCE(NULLIF(winner.Past_Current_Buyer_Type_2016__c,''),NULLIF(loser.Past_Current_Buyer_Type_2016__c,''))	 AS [Past_Current_Buyer_Type_2016__c]
,COALESCE(winner.Past_Current_Buyer_Type_2017__c,loser.Past_Current_Buyer_Type_2017__c)	 AS [Past_Current_Buyer_Type_2017__c]
,COALESCE(NULLIF(winner.Phone_Notes_Primary__c,''),NULLIF(loser.Phone_Notes_Primary__c,''))	 AS [Phone_Notes_Primary__c]
,COALESCE(NULLIF(winner.PhotoUrl,''),NULLIF(loser.PhotoUrl,''))	 AS [PhotoUrl]
,COALESCE(NULLIF(winner.Race__c,''),NULLIF(loser.Race__c,''))	 AS [Race__c]
,COALESCE(NULLIF(winner.Reno_Bighorns_Contact__c,''),NULLIF(loser.Reno_Bighorns_Contact__c,''))	 AS [Reno_Bighorns_Contact__c]
,COALESCE(winner.ReportsToId,loser.ReportsToId)	 AS [ReportsToId]
,COALESCE(NULLIF(winner.Residence_Length__c,''),NULLIF(loser.Residence_Length__c,''))	 AS [Residence_Length__c]
,COALESCE(NULLIF(winner.rh2__Currency_Test__c,''),NULLIF(loser.rh2__Currency_Test__c,''))	 AS [rh2__Currency_Test__c]
,COALESCE(NULLIF(winner.rh2__Describe__c,''),NULLIF(loser.rh2__Describe__c,''))	 AS [rh2__Describe__c]
,COALESCE(NULLIF(winner.rh2__Formula_Test__c,''),NULLIF(loser.rh2__Formula_Test__c,''))	 AS [rh2__Formula_Test__c]
,COALESCE(NULLIF(winner.rh2__Integer_Test__c,''),NULLIF(loser.rh2__Integer_Test__c,''))	 AS [rh2__Integer_Test__c]
,COALESCE(winner.Role__c,loser.Role__c)	 AS [Role__c]
,COALESCE(NULLIF(winner.Salutation,''),NULLIF(loser.Salutation,''))	 AS [Salutation]
,COALESCE(NULLIF(winner.Same_Account_Owner__c,''),NULLIF(loser.Same_Account_Owner__c,''))	 AS [Same_Account_Owner__c]
,COALESCE(NULLIF(winner.SFSSDupeCatcher__Override_DupeCatcher__c,''),NULLIF(loser.SFSSDupeCatcher__Override_DupeCatcher__c,''))	 AS [SFSSDupeCatcher__Override_DupeCatcher__c]
,COALESCE(NULLIF(winner.Spouse__c,''),NULLIF(loser.Spouse__c,''))	 AS [Spouse__c]
,COALESCE(NULLIF(winner.SSB_CRMSYSTEM_APIID__c,''),NULLIF(loser.SSB_CRMSYSTEM_APIID__c,''))	 AS [SSB_CRMSYSTEM_APIID__c]
,COALESCE(NULLIF(winner.SSB_CRMSYSTEM_STH_Flag__c,''),NULLIF(loser.SSB_CRMSYSTEM_STH_Flag__c,''))	 AS [SSB_CRMSYSTEM_STH_Flag__c]
,COALESCE(NULLIF(winner.SSB_CRMSYSTEM_STH_Years__c,''),NULLIF(loser.SSB_CRMSYSTEM_STH_Years__c,''))	 AS [SSB_CRMSYSTEM_STH_Years__c]
,COALESCE(NULLIF(winner.Status__c,''),NULLIF(loser.Status__c,''))	 AS [Status__c]
,COALESCE(NULLIF(winner.SystemModstamp,''),NULLIF(loser.SystemModstamp,''))	 AS [SystemModstamp]
,COALESCE(NULLIF(winner.Temp_Field__c,''),NULLIF(loser.Temp_Field__c,''))	 AS [Temp_Field__c]
,COALESCE(NULLIF(winner.Title,''),NULLIF(loser.Title,''))	 AS [Title]
,COALESCE(NULLIF(winner.ToutApp__Tout_Current_Campaign__c,''),NULLIF(loser.ToutApp__Tout_Current_Campaign__c,''))	 AS [ToutApp__Tout_Current_Campaign__c]
,COALESCE(winner.ToutApp__Tout_Last_Activity__c,loser.ToutApp__Tout_Last_Activity__c)	 AS [ToutApp__Tout_Last_Activity__c]
,COALESCE(winner.ToutApp__Tout_Last_Engagement__c,loser.ToutApp__Tout_Last_Engagement__c)	 AS [ToutApp__Tout_Last_Engagement__c]
,COALESCE(winner.ToutApp__Tout_Last_Replied__c,loser.ToutApp__Tout_Last_Replied__c)	 AS [ToutApp__Tout_Last_Replied__c]
,COALESCE(NULLIF(winner.Twitter_Handle__c,''),NULLIF(loser.Twitter_Handle__c,''))	 AS [Twitter_Handle__c]
,COALESCE(NULLIF(winner.Unqualified_Reason__c,''),NULLIF(loser.Unqualified_Reason__c,''))	 AS [Unqualified_Reason__c]
,COALESCE(NULLIF(winner.zisf__zoom_id__c,''),NULLIF(loser.zisf__zoom_id__c,''))	 AS [zisf__zoom_id__c]
,COALESCE(winner.zisf__zoom_lastupdated__c,loser.zisf__zoom_lastupdated__c)	 AS [zisf__zoom_lastupdated__c]

FROM [MERGEPROCESS_New].vw_Queue_Contact a
	JOIN mergeprocess_new.tmp_pccontact winner ON a.Master_SFID = winner.id
	JOIN mergeprocess_new.tmp_pccontact loser ON a.Slave_SFID = loser.id;
GO