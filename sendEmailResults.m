function sendEmailResults(receiverEmail)
% This code works only for outlook email id
% There was some security changes in Google and Yahoo, so we cant use this
% code for Google and Yahoo.

% senderEmail = 'MyOutlookEmailID;       % Replace with your email address: 
% senderPwd = 'MyPassword.';              % Replace with your email password
senderEmail = 'bloodresult@outlook.com';       
senderPwd = 'Karan@9108';
server = 'smtp-mail.outlook.com';       % Replace with your SMTP server
props = java.lang.System.getProperties;
props.setProperty(server,'587');        % 587 is the port number for Outlook server
props.setProperty('mail.smtp.starttls.enable','true'); % Set this to true
props.setProperty('mail.smtp.auth','true');            % Set this to true

% Apply prefs and props
% Please delete the preferences dir before running this script
setpref('Internet','E_mail',senderEmail);
setpref('Internet','SMTP_Server',server);
setpref('Internet','SMTP_Username',senderEmail);
setpref('Internet','SMTP_Password',senderPwd);

% Send the email
sendmail(receiverEmail, 'Test', 'Email from MATLAB','results.jpg');
