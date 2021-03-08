program PRORETAIL;

uses
  Vcl.Forms,
  FRMRETAIL in 'FRMRETAIL.pas' {FRRETAIL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRRETAIL, FRRETAIL);
  Application.Run;
end.
