unit frmEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxBarBuiltInMenu, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, cxDropDownEdit, AdvMemo, Vcl.Grids, Vcl.ValEdit, AdvOfficePager,
  cxGroupBox, cxRadioGroup, cxCheckBox, cxPC, cxSpinEdit, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, untDatamodule, cxStyles, cxVGrid, cxDBVGrid, cxInplaceContainer, cxGridCardView, cxClasses;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxDBVerticalGrid1: TcxDBVerticalGrid;
    cxDBVerticalGrid1VALOR_ORIGEM: TcxDBEditorRow;
    cxDBVerticalGrid1VALOR_DESTINO: TcxDBEditorRow;
    cxDBVerticalGrid1ACEITA_NULL: TcxDBEditorRow;
    cxDBVerticalGrid1GERAR_VALOR: TcxDBEditorRow;
    cxDBVerticalGrid1TIPOVALOR_GERAR: TcxDBEditorRow;
    cxDBVerticalGrid1VALOR_A_CONSIDERAR: TcxDBEditorRow;
    cxDBVerticalGrid1PERSONAL_SELECT: TcxDBEditorRow;
    cxDBVerticalGrid1USAR_COMO_WHERE: TcxDBEditorRow;
    cxDBVerticalGrid1CARACTERES_REMOVER: TcxDBEditorRow;
    cxDBVerticalGrid1_SQL: TcxDBEditorRow;
    cxDBVerticalGrid1RETIRAR_ACENTOS: TcxDBEditorRow;
    cxDBVerticalGrid1CONVETER_MAIUSCULO: TcxDBEditorRow;
    cxDBVerticalGrid1FILTRAR_CARACTERES: TcxDBEditorRow;
    cxDBVerticalGrid1AJUSTAR_TAMANHO: TcxDBEditorRow;
    cxDBVerticalGrid1CHAVE_PRIMARIA_DESTINO: TcxDBEditorRow;
    cxDBVerticalGrid1ORDEM_EXEC: TcxDBEditorRow;
    cxDBVerticalGrid1PERS_SELECT_WHERE: TcxDBEditorRow;
    cxDBVerticalGrid1SEQUENCIA: TcxDBEditorRow;
    cxDBVerticalGrid1CHAVE_PRIMARIA_ORIGEM: TcxDBEditorRow;
    cxDBVerticalGrid1TCAMPO: TcxDBEditorRow;
    cxDBVerticalGrid1COMPORCHAVEDEFAULT: TcxDBEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGridCardViewStyleSheet1: TcxGridCardViewStyleSheet;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxDBVerticalGrid1DEFAULT_VALOR: TcxDBEditorRow;
    cxDBVerticalGrid1CAMPO_ORIGEM: TcxDBEditorRow;
    cxDBVerticalGrid1CAMPO_DESTINO: TcxDBEditorRow;
    cxDBVerticalGrid1RTFTOTEXT: TcxDBEditorRow;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    Fconfirmou: Boolean;

    { Private declarations }
  public
    { Public declarations }
    class function abreform(ID:STRING):boolean; static;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

class function TForm2.abreform(ID:STRING):boolean;
begin
  Form2:=TForm2.Create(Application);
  try
    Form2.Caption := 'Editor de Parametros ('+ID+')';
    dm.QryParametroEdit.Close;
    dm.QryParametroEdit.DeleteWhere;
    dm.QryParametroEdit.RestoreSQL;
    dm.QryParametroEdit.AddWhere('CV.ID = '+ID);
    dm.QryParametroEdit.Open;
    dm.QryParametroEdit.Edit;
    Form2.ShowModal;
    dm.QryParametroEdit.Post;
    if Form2.Fconfirmou then
      if dm.QryParametroEdit.UpdatesPending then
        dm.QryParametroEdit.ApplyUpdates();
  finally
    Result := Form2.Fconfirmou;
    FreeAndNil(Form2);
  end;


end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Fconfirmou := true;
  close;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Fconfirmou := false;
  close;
end;

end.
