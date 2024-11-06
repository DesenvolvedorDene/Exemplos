unit untProjeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untDatamodule, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit;

type
  TfrmProjeto = class(TForm)
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    StatusBar1: TStatusBar;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FConfirma: Boolean;

    { Private declarations }
  public
    { Public declarations }
    class function Abreiniciaprojeot: boolean; static;
  end;

var
  frmProjeto: TfrmProjeto;

implementation

{$R *.dfm}

class function TfrmProjeto.Abreiniciaprojeot:boolean;
begin
  frmProjeto := TfrmProjeto.Create(Application);
  try
    frmProjeto.ShowModal;
  finally
    Result := frmProjeto.FConfirma;
    FreeAndNil(frmProjeto);
  end;

end;

procedure TfrmProjeto.btnCancelarClick(Sender: TObject);
begin
  if dm.MsgPerguntaSimNao('Tem certeza que dseja cancelar a criação deste projeto?.') then
  begin
    FConfirma := false;
    close;
  end;
end;

procedure TfrmProjeto.btnConfirmarClick(Sender: TObject);
begin
   FConfirma := true;
   close;
end;

end.
