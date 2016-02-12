#define MyAppName "vocal"
#define MyAppVersion "1.5.2"
#define MyAppPublisher "NASA DEVELOP"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "Calipso.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{454CC175-D5EC-41C8-9E3F-580334AFB49F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
; NOTE: CHANGE PATHS TO OUTPUT LOCATION OF YOUR CHOICE
OutputDir=C:\Users\kdmoore2\Documents\VOCALexes
OutputBaseFilename=vocal_setup
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
SetupLogging=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[code]
// Called just before Setup terminates. Note that this function is called even if the user exits Setup before anything is installed.
procedure DeinitializeSetup();
var
  logfilepathname, logfilename, newfilepathname: string;

begin
  logfilepathname := expandconstant('{log}');
  logfilename := ExtractFileName(logfilepathname);
  // Set the new target path as the directory where the installer is being run from
  newfilepathname := expandconstant('{src}\') +logfilename;

  filecopy(logfilepathname, newfilepathname, false);
end; 

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

; NOTE: CHANGE PATHS TO YOUR LOCATION OF VOCAL BUILD
[Files]
Source: "C:\Users\kdmoore2\Documents\VOCALgit\vocal\core\Calipso.exe"; DestDir: "{app}\core"; Flags: ignoreversion
Source: "C:\Users\kdmoore2\Documents\VOCALgit\vocal\dat\*"; DestDir: "{app}\vocal\dat"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\kdmoore2\Documents\VOCALgit\vocal\db\*"; DestDir: "{app}\vocal\db"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\kdmoore2\Documents\VOCALgit\vocal\log\*"; DestDir: "{app}\vocal\log"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\kdmoore2\Documents\VOCALgit\vocal\ico\*"; DestDir: "{app}\vocal\ico"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\kdmoore2\Documents\VOCALgit\vocal\dat_\*"; DestDir: "{app}\vocal\dat"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\kdmoore2\Documents\VOCALgit\vocal\core\*"; DestDir: "{app}\core"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\core\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\core\{#MyAppExeName}"; Tasks: desktopicon
