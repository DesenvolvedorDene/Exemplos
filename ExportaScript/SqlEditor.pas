{********************************************************************}
{ TAdvMemo demo                                                      }
{ for Delphi 5,6,7 & C++Builder 5,6                                  }
{ version 1.5.0.7                                                    }
{                                                                    }
{ written by TMS Software                                            }
{            copyright © 2001-2004                                   }
{            Email : info@tmssoftware.com                            }
{            Website : http://www.tmssoftware.com                    }
{********************************************************************}

unit SqlEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AdvMemo, StdCtrls, ExtCtrls, Menus, Buttons, ExtDlgs, Printers, Advmps,
  advmsqls, advmws, ActnList, Vcl.ComCtrls, System.Actions, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxMemo, cxTextEdit, cxMaskEdit, cxDropDownEdit
  {$IFDEF VER150}
  , xpman
  {$ENDIF}
  ;

type
  TformEditorSql = class(TForm)
    sqlmemo: TAdvMemo;
    Panel1: TPanel;
    spbCut: TSpeedButton;
    spbPaste: TSpeedButton;
    spbSave: TSpeedButton;
    spbOpen: TSpeedButton;
    spbCopy: TSpeedButton;
    spbUndo: TSpeedButton;
    spbRedo: TSpeedButton;
    spbNew: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SaveDialog2: TSaveDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    AdvMemoFindDialog1: TAdvMemoFindDialog;
    AdvMemoFindReplaceDialog1: TAdvMemoFindReplaceDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    ActionList1: TActionList;
    AdvMemoCut1: TAdvMemoCut;
    AdvMemoCopy1: TAdvMemoCopy;
    AdvMemoPaste1: TAdvMemoPaste;
    N1: TMenuItem;
    Undo1: TMenuItem;
    AdvMemoUndo1: TAdvMemoUndo;
    AdvMemoRedo1: TAdvMemoRedo;
    AdvMemoRedo11: TMenuItem;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    btncancela: TBitBtn;
    btnconfirma: TBitBtn;
    btnteste: TBitBtn;
    EdtNome: TcxTextEdit;
    MmObs: TcxMemo;
    lbnome: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    cbSistema: TcxComboBox;
    procedure spbNewClick(Sender: TObject);
    procedure spbOpenClick(Sender: TObject);
    procedure spbSaveClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure btnconfirmaClick(Sender: TObject);
    procedure btncancelaClick(Sender: TObject);
    procedure btntesteClick(Sender: TObject);
  private


    { Private declarations }
  public
    { Public declarations }
    FConfirmar: Boolean;
    class function AbreEditorSQL(Sql, Nomeqry, Observac,sistema: string;editar:boolean=false): TformEditorSql; static;
  end;

var
  formEditorSql: TformEditorSql;

implementation



{$R *.DFM}

uses untDatamodule;

procedure TformEditorSql.spbNewClick(Sender: TObject);
begin
  sqlmemo.Clear;
end;

procedure TformEditorSql.spbOpenClick(Sender: TObject);
var
  filename:string;
  extension:string;
  length_filename:Integer;

begin
  if OpenDialog1.Execute then
  begin
    filename := OpenDialog1.FileName;
    sqlmemo.Lines.LoadFromFile(filename);
    //determine the extension of the filename
    length_filename := Length(filename);
    extension := Copy(filename,length_filename - 2,3);

  end;
end;

procedure TformEditorSql.spbSaveClick(Sender: TObject);
var
  filename: string;

begin

  if SaveDialog1.Execute then
  begin
    filename := SaveDialog1.FileName;
    sqlmemo.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TformEditorSql.SpeedButton4Click(Sender: TObject);
begin
  if savedialog2.Execute then
     sqlmemo.SaveToHTML(SaveDialog2.FileName);
end;

procedure TformEditorSql.SpeedButton3Click(Sender: TObject);
begin
  if PrinterSetupDialog1.Execute then
    sqlmemo.Print;
end;

procedure TformEditorSql.SpeedButton1Click(Sender: TObject);
begin
  AdvMemoFindDialog1.Execute;
end;

procedure TformEditorSql.SpeedButton2Click(Sender: TObject);
begin
  AdvMemoFindReplaceDialog1.Execute;
end;

procedure TformEditorSql.SpeedButton5Click(Sender: TObject);
begin
  sqlmemo.CopyHTMLToClipboard;
end;

procedure TformEditorSql.btncancelaClick(Sender: TObject);
begin

  FConfirmar := False;
  Self.Close;
end;

procedure TformEditorSql.btnconfirmaClick(Sender: TObject);
begin
  if trim(EdtNome.Text) = '' then
  begin
    showmessage('E nescessario informar um nome para a query');
    exit;
  end;
  if cbSistema.EditText = '' then
   begin
    showmessage('E nescessario Selecionar um sitema de destino ou geral caso seja um script que geral.');
    exit;
  end;
  if trim(sqlmemo.Lines.Text) = '' then
  begin
    showmessage('Não ha sql para salvar');
    exit;
  end;
  FConfirmar := True;
  Self.Close;
end;

procedure TformEditorSql.btntesteClick(Sender: TObject);
begin
  dm.ScriptTeste.sql.Clear;
  dm.ScriptTeste.SQL.Text := sqlmemo.Lines.Text;
  dm.ScriptTeste.Execute;

end;

procedure TformEditorSql.FormCreate(Sender: TObject);
begin
  FConfirmar := True;
  sqlmemo.Clear;
  MmObs.Clear;
  EdtNome.Clear;
end;

procedure TformEditorSql.New1Click(Sender: TObject);
begin
  sqlmemo.Clear;
end;

class function TformEditorSql.AbreEditorSQL(Sql,Nomeqry,Observac,sistema:string;editar:boolean=false):TformEditorSql;
begin
  Application.CreateForm(TformEditorSql,formEditorSql);
  Result                            := formEditorSql;
  formEditorSql.sqlmemo.Lines.Text  := Sql;
  formEditorSql.EdtNome.Text        := Nomeqry;
  formEditorSql.MmObs.Lines.Text    := Nomeqry;
  formEditorSql.cbSistema.EditText  := sistema;
  formEditorSql.cbSistema.Enabled   := not editar;
  formEditorSql.EdtNome.Enabled     := not editar;
  formEditorSql.ShowModal;
end;


end.



