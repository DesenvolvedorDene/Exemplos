unit MainForm;

interface

uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Shadow;

type
     TShadowTestForm = class(TForm)
       Button1: TButton;
       Button2: TButton;
       Panel1: TPanel;
       Button3: TButton;
       Button4: TButton;
       Panel2: TPanel;
       Button5: TButton;
       procedure Button1Click(Sender: TObject);
       procedure FormResize(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure Button4Click(Sender: TObject);
       procedure Button5Click(Sender: TObject);
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
     private
       { Private declarations }
       Shadow: TShadowForm;
       procedure WMMove(var Message: TWMMove); message WM_MOVE;
     public
       { Public declarations }
     end;

var
     ShadowTestForm: TShadowTestForm;

implementation

{$R *.dfm}

procedure TShadowTestForm.Button1Click(Sender: TObject);
begin
     if not Assigned(Shadow) then
     begin
       Shadow := TShadowForm.CreateShadow(Self);
       Shadow.UpdateShadow;
       Button1.Caption := 'Hide Shadow';
       Button4.Caption := 'Show Modal Form';
     end else
     begin
       FreeAndNil(Shadow);
       Button1.Caption := 'Show Shadow';
       Button4.Caption := 'Test Click';
     end;
end;

procedure TShadowTestForm.Button2Click(Sender: TObject);
begin
     ShowMessage('clicked ' + TControl(Sender).Name);
end;

procedure TShadowTestForm.Button4Click(Sender: TObject);
var
     tmpFrm: TForm;
begin
     if Assigned(Shadow) then
     begin
       tmpFrm := TShadowTestForm.Create(nil);
       try
         tmpFrm.ShowModal;
       finally
         tmpFrm.Free;
       end;
     end else
       Button2Click(Sender);
end;

procedure TShadowTestForm.Button5Click(Sender: TObject);
begin
     TShadowForm.Create(Self).Show;
end;

procedure TShadowTestForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if not (fsModal in FormState) then
       Action := caFree;
end;

procedure TShadowTestForm.FormResize(Sender: TObject);
begin
     if Assigned(Shadow) then Shadow.UpdateShadow;
end;

procedure TShadowTestForm.WMMove(var Message: TWMMove);
begin
     inherited;
     if Assigned(Shadow) then Shadow.UpdateShadow;
end;

end.
