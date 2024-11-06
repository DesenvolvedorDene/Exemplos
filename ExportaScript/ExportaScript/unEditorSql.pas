unit unEditorSql;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxButtonEdit, Vcl.DBGrids, AdvMemo,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.Grids, CRGrid, cxTextEdit, Vcl.StdCtrls, Vcl.Buttons, cxMaskEdit, cxDropDownEdit, Vcl.ExtCtrls, untDatamodule;

type
  TfrmEditorSql = class(TForm)
    DSSeletor: TDataSource;
    pnlselect: TPanel;
    Panel3: TPanel;
    Label25: TLabel;
    CBconexaosel: TcxComboBox;
    BitBtn5: TBitBtn;
    btnlimpar: TBitBtn;
    CRDBGrid2: TCRDBGrid;
    Panel14: TPanel;
    Panel17: TPanel;
    editorsqlmemo: TAdvMemo;
    Panel26: TPanel;
    DBGrid1: TDBGrid;
    procedure BitBtn5Click(Sender: TObject);
    procedure btnlimparClick(Sender: TObject);
    procedure CBconexaoselPropertiesCloseUp(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

    { Private declarations }
  public
    { Public declarations }
    class function AbreEditor: TfrmEditorSql; static;
  end;

var
  frmEditorSql: TfrmEditorSql;

implementation

{$R *.dfm}

procedure TfrmEditorSql.BitBtn5Click(Sender: TObject);
var
  vselect :string;
begin
  if (editorsqlmemo.Selection <> '') then
    vselect:= editorsqlmemo.Selection
  else
    vselect:= editorsqlmemo.Lines.Text;

  try
    dm.QryEditor.close;
    dm.QryEditor.SQL.Text := vselect;
    dm.QryEditor.ExecSQL;
  except
    raise;
  end;

end;

class function TfrmEditorSql.AbreEditor:TfrmEditorSql;
begin
  frmEditorSql := TfrmEditorSql.Create(Application);
  frmEditorSql.Show;
end;

procedure TfrmEditorSql.btnlimparClick(Sender: TObject);
begin
  dm.QryEditor.close;
  editorsqlmemo.Lines.Clear;
end;

procedure TfrmEditorSql.CBconexaoselPropertiesCloseUp(Sender: TObject);
begin
   dm.MdSelector.Close;
  case CBconexaosel.ItemIndex of
    0: begin
         dm.QryEditor.Connection := dm.CcnOrigem;
         dm.MdSelector.Connection := dm.CcnOrigem;
       end;
    1: begin
         dm.QryEditor.Connection := dm.CcnDestino;
         dm.MdSelector.Connection := dm.CcnDestino;
       end;
    2: begin
         dm.QryEditor.Connection := dm.CcnParametros;
         dm.MdSelector.Connection := dm.CcnParametros;
       end;
  end;
  dm.MdSelector.open;
end;

procedure TfrmEditorSql.DBGrid1DblClick(Sender: TObject);
begin
  editorsqlmemo.Lines.Add('Select * from '+dm.MdSelector.fieldbyname('TABLE_NAME').AsString);
end;

procedure TfrmEditorSql.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

end.
