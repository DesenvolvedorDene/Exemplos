unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UniProvider, SQLServerUniProvider, Data.DB, MemDS, DBAccess, Uni, DALoader, UniLoader, Vcl.Grids, Vcl.DBGrids, CRGrid, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    CRDBGrid1: TCRDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
