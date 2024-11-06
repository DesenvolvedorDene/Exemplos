unit UntGeradorScript;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UniProvider, SQLServerUniProvider, Data.DB, MemDS, DBAccess, Uni,
  DALoader, UniLoader, Vcl.Grids, Vcl.DBGrids, CRGrid, Vcl.StdCtrls, Vcl.DBCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGroupBox, dxGDIPlusClasses,
  Vcl.ExtCtrls, cxPC, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.ComCtrls,System.DateUtils,System.StrUtils,
  System.IOUtils, ECripto, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Datasnap.DBClient,
  Vcl.Buttons, cxSpinEdit, cxDBEdit, Vcl.Menus, cxCalendar, AdvOfficePager, AdvOfficePagerStylers,
  Vcl.ValEdit, cxRadioGroup, AdvMemo, AdvmSQLS, cxCheckBox,FileCtrl, cxMemo,Shadow,Registry, cxProgressBar, midaslib,
  System.Hash, cxLabel, cxButtonEdit, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, untProjeto, frmEdit, Vcl.Mask, unEditorSql;

type
 TtipoChave = (tcOrigem,tcDestino);
  Tinfofield = class
    private
    FTipoOrg: TFieldType;
    FTipoDst: TFieldType;
    FSizeDst: integer;
    FSizeOrg: integer;
    FValOrg: variant;
    FValDst: variant;
    FMaiusculo : boolean;
    FRAcentos :boolean;
    FFiltro :integer;
    FRotinasql: String;
    FCampoDestino: String;
    FCampoOrigem: String;
    FWhereCheck: string;
    FPersSelect: string;
    FValorPK: integer;
    FRotinasql_prm: String;
    FCampoDefault: boolean;
    FChvPrimariaOrg: string;
    FChvPrimariaDes: string;
    FValorDefaultCampo: string;
    FOrigemSub: string;
    FCamposSomar: string;
    FValorFuSqlPers: string;
    FIdCombinacao: integer;
    FTabelaDestino: String;
    FTabelaOrigem: String;
    FRowNumero: integer;
       { private declarations }
     protected
       { protected declarations }
     public
       { public declarations }
       procedure Resetavalores;

     published
       { published declarations }
       property SizeOrg           : integer     read FSizeOrg           write FSizeOrg;
       property SizeDst           : integer     read FSizeDst           write FSizeDst;
       property TipoOrg           : TFieldType  read FTipoOrg           write FTipoOrg;
       property TipoDst           : TFieldType  read FTipoDst           write FTipoDst;
       property ValOrg            : variant     read FValOrg            write FValOrg;
       property ValDst            : variant     read FValDst            write FValDst;
       property CampoOrigem       : String      read FCampoOrigem       write FCampoOrigem;
       property CampoDestino      : String      read FCampoDestino      write FCampoDestino;
       property TabelaDestino     : String      read FTabelaDestino     write FTabelaDestino;
       property TabelaOrigem      : String      read FTabelaOrigem      write FTabelaOrigem;
       property Rotinasql         : String      read FRotinasql         write FRotinasql;
       property Maiusculo         : boolean     read FMaiusculo         write FMaiusculo;
       property RAcentos          : boolean     read FRAcentos          write FRAcentos;
       property Filtro            : integer     read FFiltro            write FFiltro;
       property PersSelect        : string      read FPersSelect        write FPersSelect;
       property WhereCheck        : string      read FWhereCheck        write FWhereCheck;
       property ValorPK           : integer     read FValorPK           write FValorPK;
       property Rotinasql_prm     : String      read FRotinasql_prm     write FRotinasql_prm;
       property CampoDefault      : boolean     read FCampoDefault      write FCampoDefault;
       property ChvPrimariaOrg    : string      read FChvPrimariaOrg    write FChvPrimariaOrg;
       property ChvPrimariaDes    : string      read FChvPrimariaDes    write FChvPrimariaDes;
       property ValorDefaultCampo : string      read FValorDefaultCampo write FValorDefaultCampo;
       Property OrigemSub         : string      read FOrigemSub         write FOrigemSub;
       Property CamposSomar       : string      Read FCamposSomar       write FCamposSomar;
       Property ValorFuSqlPers    : string      Read FValorFuSqlPers    write FValorFuSqlPers;
       Property IdCombinacao      : integer     read FIdCombinacao      write FIdCombinacao;
       Property RowNumero         : integer     read FRowNumero         write FRowNumero;
     end;


  TChars = set of Char;
  TGeradorScript = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    GroupBox2: TGroupBox;
    Image2: TImage;
    Label5: TLabel;
    lbbancotitulo: TLabel;
    Label7: TLabel;
    lbsttitulo: TLabel;
    btntitulo: TButton;
    GroupBox3: TGroupBox;
    Image3: TImage;
    Label9: TLabel;
    lbbancolocal: TLabel;
    Label11: TLabel;
    lbstlocal: TLabel;
    btnlocal: TButton;
    cxGroupBox1: TcxGroupBox;
    TbShmodelar: TcxTabSheet;
    Panel1: TPanel;
    GroupBox1: TcxGroupBox;
    StatusBar1: TStatusBar;
    Cripto: TEvCriptografa;
    CDSOrigem: TClientDataSet;
    CDSOrigemid: TIntegerField;
    CDSOrigemnome: TStringField;
    CDSOrigemnomeTipo: TStringField;
    CDSOrigemnumTipo: TIntegerField;
    CDSOrigemsize: TIntegerField;
    CDSDestino: TClientDataSet;
    CDSDestinoid: TIntegerField;
    CDSDestinonome: TStringField;
    CDSDestinonomeTipo: TStringField;
    CDSDestinonumTipo: TIntegerField;
    CDSDestinosize: TIntegerField;
    DSOrigem: TDataSource;
    DSDestino: TDataSource;
    CDSCAMPOS_D: TClientDataSet;
    CDSCAMPOS_DCAMPOORIGEM: TStringField;
    CDSCAMPOS_DCAMPODESTINO: TStringField;
    DSCAMPOS_D: TDataSource;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    AbrirProjeto1: TMenuItem;
    NovoProjeto1: TMenuItem;
    Fechar1: TMenuItem;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Label14: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label15: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label16: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label17: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxTabSheet2: TcxTabSheet;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    CDSDestinoAceita_Null: TBooleanField;
    CDSDestinoOrdem: TIntegerField;
    CDSDestinoPosChavePrimaria: TBooleanField;
    CDSDestinoseqopcao: TIntegerField;
    Label19: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label20: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxGroupBox6: TcxGroupBox;
    Label21: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxPageControl2: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    GroupBox8: TGroupBox;
    CDSDestinoidxcampo: TIntegerField;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    CDSCAMPOS_Did: TAutoIncField;
    DSCAMPOS_O: TDataSource;
    CDSCAMPOS_O: TClientDataSet;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    cxTabSheet5: TcxTabSheet;
    Panel3: TPanel;
    CBconexaosel: TcxComboBox;
    Label25: TLabel;
    BitBtn5: TBitBtn;
    CRDBGrid2: TCRDBGrid;
    CDSDestinoTabela: TStringField;
    CDSOrigemTabela: TStringField;
    AdvMemo1: TMemo;
    Panel5: TPanel;
    Label27: TLabel;
    Editlocal: TEdit;
    SpeedButton3: TSpeedButton;
    BitBtn6: TBitBtn;
    CRDBGrid4: TCRDBGrid;
    Panel6: TPanel;
    CRDBGrid1: TCRDBGrid;
    cxDBMemo1: TcxDBMemo;
    CDSDestinoNomeChavepk: TStringField;
    Label28: TLabel;
    lkbarquivoscrp: TcxLookupComboBox;
    BitBtn7: TBitBtn;
    edtNomeScript: TcxTextEdit;
    Label29: TLabel;
    memoarquivo: TMemo;
    PopupMenu2: TPopupMenu;
    DeletarScript1: TMenuItem;
    CDSWhereItens: TClientDataSet;
    CDSWhereItensid: TAutoIncField;
    CDSWhereItensfield: TStringField;
    CDSWhereItenscomparativo: TStringField;
    CDSWhereItensfiewldvalor: TStringField;
    cxPageControl3: TcxPageControl;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    memoscript: TMemo;
    Panel9: TPanel;
    Panel10: TPanel;
    Label23: TLabel;
    lbgerar: TLabel;
    cxSpEdtcomit: TcxSpinEdit;
    btnEcecutar: TButton;
    lkptabelas: TcxLookupComboBox;
    pnlcomitt: TPanel;
    ChkLimitar: TcxCheckBox;
    cxSpinEdit1: TcxSpinEdit;
    Panel18: TPanel;
    Memo1: TMemo;
    Panel19: TPanel;
    Panel21: TPanel;
    Label32: TLabel;
    cxSpinEdit2: TcxSpinEdit;
    Button2: TButton;
    Panel22: TPanel;
    cxCheckBox3: TcxCheckBox;
    cxSpinEdit3: TcxSpinEdit;
    Panel20: TPanel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Panel24: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxComboBox1: TcxComboBox;
    cxComboBox2: TcxComboBox;
    Label37: TLabel;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    rdgtipoexec: TcxRadioGroup;
    PgBarScript: TcxProgressBar;
    PgbarReg: TcxProgressBar;
    cxPageControl4: TcxPageControl;
    tabAssociar: TcxTabSheet;
    cxTabSheet9: TcxTabSheet;
    GroupBox6: TGroupBox;
    Panel4: TPanel;
    Label3: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DBLkCBCampoDestino: TcxDBLookupComboBox;
    edittipoDestino: TcxTextEdit;
    edsizeDestino: TcxSpinEdit;
    cxpageopschar: TcxPageControl;
    cxTabSheet10: TcxTabSheet;
    Label38: TLabel;
    GroupBox9: TGroupBox;
    Label26: TLabel;
    EdtCaracteres: TEdit;
    ChkBCaracteres: TCheckBox;
    tabAlterar: TcxTabSheet;
    chkretacentos: TcxCheckBox;
    chkmaiusculo: TcxCheckBox;
    chkAjustar: TcxCheckBox;
    cxTabSheet11: TcxTabSheet;
    RDXFiltrar: TcxRadioGroup;
    cxTabSheet12: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    pageOpcoes: TAdvOfficePager;
    AdvOfficePage2: TAdvOfficePage;
    cxRGSequencia: TcxRadioGroup;
    cxGroupBox7: TcxGroupBox;
    Panel2: TPanel;
    Label18: TLabel;
    chkprimarykey: TCheckBox;
    AdvOfficePage1: TAdvOfficePage;
    lbsubs: TLabel;
    valueSubs: TValueListEditor;
    AdvOfficePage3: TAdvOfficePage;
    AdvOfficePage4: TAdvOfficePage;
    memocondicao: TAdvMemo;
    Panel16: TPanel;
    Label30: TLabel;
    ChkBWhere: TcxCheckBox;
    RGWhere: TcxComboBox;
    Panel15: TPanel;
    Panel23: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    SpeedButton4: TSpeedButton;
    EdtCampo: TLabeledEdit;
    edtValor: TLabeledEdit;
    chkm: TCheckBox;
    chkAc: TCheckBox;
    edtOper: TLabeledEdit;
    edtcomp: TLabeledEdit;
    CbFil: TcxComboBox;
    MmWhere: TAdvMemo;
    Panel11: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    groupsetaordem: TcxGroupBox;
    Label24: TLabel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    TAbSeq: TcxPageControl;
    seqSystema: TcxTabSheet;
    setImport: TcxTabSheet;
    lbexplicaacao: TLabel;
    lbvalor: TLabel;
    cxSEvalor: TcxSpinEdit;
    editSeqNOme: TcxTextEdit;
    Label43: TLabel;
    spnvalorSeqexpec: TcxSpinEdit;
    Label44: TLabel;
    RdgOperacoes: TcxRadioGroup;
    CheckBox1: TCheckBox;
    cxPageControl5: TcxPageControl;
    cxTabSheet8: TcxTabSheet;
    cxTabSheet13: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1SISTEMA: TcxGridDBColumn;
    cxGrid1DBTableView1TABELA_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1TABELA_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1CAMPO_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1TIPODADO_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1TAM_CAMPO_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1CAMPO_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1TIPODADO_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1TAM_CAMPO_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1PERSONAL_SELECT: TcxGridDBColumn;
    cxGrid1DBTableView1ACEITA_NULL: TcxGridDBColumn;
    cxGrid1DBTableView1RETIRAR_ACENTOS: TcxGridDBColumn;
    cxGrid1DBTableView1CONVETER_MAIUSCULO: TcxGridDBColumn;
    cxGrid1DBTableView1AJUSTAR_TAMANHO: TcxGridDBColumn;
    cxGrid1DBTableView1FILTRAR_CARACTERES: TcxGridDBColumn;
    cxGrid1DBTableView1USAR_COMO_WHERE: TcxGridDBColumn;
    cxGrid1DBTableView1GERAR_VALOR: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_A_CONSIDERAR: TcxGridDBColumn;
    cxGrid1DBTableView1CHAVE_PRIMARIA_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1TIPOVALOR_GERAR: TcxGridDBColumn;
    cxGrid1DBTableView1CARACTERES_REMOVER: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1BANCO_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1BANCO_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1ID_PROJETO: TcxGridDBColumn;
    cxGrid1DBTableView1SISTEMAID: TcxGridDBColumn;
    cxGrid1DBTableView1IDX_CAMPO_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1IDX_CAMPO_DESTINO: TcxGridDBColumn;
    cxGrid1DBTableView1_SQL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cGridPersonalFields: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1ID_PROJETO: TcxGridDBColumn;
    cxGridDBTableView1TABELA_DESTINO: TcxGridDBColumn;
    cxGridDBTableView1ROTINA_SQL: TcxGridDBColumn;
    cxGridDBTableView1PERSONAL_CAMPO: TcxGridDBColumn;
    cxGridDBTableView1TIPO_CAMPO: TcxGridDBColumn;
    cxGridDBTableView1TABELA_ORIGEM: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label45: TLabel;
    cxDBMemo2: TcxDBMemo;
    Label31: TPanel;
    GPTabelas: TPanel;
    Label49: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label41: TLabel;
    cbxkeyfieldOrigem: TcxComboBox;
    DBLKCBOrigem: TcxDBLookupComboBox;
    DBLKCBDestino: TcxDBLookupComboBox;
    cbxkeyfield: TcxComboBox;
    Panel13: TPanel;
    Label4: TLabel;
    Label22: TLabel;
    cbSistema: TcxComboBox;
    CBxTipo: TcxComboBox;
    cxGrid1DBTableView1ORDEM_EXEC: TcxGridDBColumn;
    cxGrid1DBTableView1PERS_SELECT_WHERE: TcxGridDBColumn;
    cxGrid1DBTableView1SEQUENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1CHAVE_PRIMARIA_ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1TCAMPO: TcxGridDBColumn;
    cxGroupBox3: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3TABELA_DESTINO: TcxGridDBColumn;
    cxGridDBTableView3TABELA_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView3CAMPO_WHERE: TcxGridDBColumn;
    cxGridDBTableView3TIPO_CAMPOWHR: TcxGridDBColumn;
    cxGridDBTableView3ROTINA_SQL: TcxGridDBColumn;
    cxGridDBTableView3SE_EXISTE: TcxGridDBColumn;
    cxGridDBTableView3COMPARACOES: TcxGridDBColumn;
    cxGridDBTableView3selectgeral: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxDBMemo3: TcxDBMemo;
    sporigem: TSpeedButton;
    spdestino: TSpeedButton;
    Panel12: TPanel;
    cxGrid4: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableView4ID: TcxGridDBColumn;
    cxGridDBTableView4ID_PROJETO: TcxGridDBColumn;
    cxGridDBTableView4TIPO_SCRIPT: TcxGridDBColumn;
    cxGridDBTableView4SCRIPT: TcxGridDBColumn;
    cxGridDBTableView4SCRIPT_ARQ: TcxGridDBColumn;
    cxGridDBTableView4DATA_INSERT: TcxGridDBColumn;
    cxGridDBTableView4RESPONSAVEL_NOME: TcxGridDBColumn;
    cxGridDBTableView4TABELA_DESTINO: TcxGridDBColumn;
    cxGridDBTableView4TABELA_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView4NOME_ARQUIVO: TcxGridDBColumn;
    Panel14: TPanel;
    cxGridDBTableView4Column1: TcxGridDBColumn;
    ActionManager1: TActionManager;
    acExecsqlscr: TAction;
    acEcluirreg: TAction;
    cxGrid1DBTableView1COMPORCHAVEDEFAULT: TcxGridDBColumn;
    DeletarCombinao1: TMenuItem;
    DeletaRegistro1: TMenuItem;
    EditarCombinao1: TMenuItem;
    tabdefault: TcxTabSheet;
    Label46: TLabel;
    EdtDefaultValor: TcxTextEdit;
    Label47: TLabel;
    Panel17: TPanel;
    editorsqlmemo: TAdvMemo;
    Panel26: TPanel;
    DSSeletor: TDataSource;
    DBGrid1: TDBGrid;
    btnlimpar: TBitBtn;
    Label48: TLabel;
    Panel27: TPanel;
    DBEdit1: TDBEdit;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    PgAssoc: TcxPageControl;
    cxTabSheet14: TcxTabSheet;
    cxTabSheet15: TcxTabSheet;
    Label42: TLabel;
    sqlmemoAssocD: TAdvMemo;
    Label53: TLabel;
    sqlmemoAssocO: TAdvMemo;
    CHKAssociar: TCheckBox;
    Ferramentas1: TMenuItem;
    EdiotordeConsultasSql1: TMenuItem;
    lbrow: TLabel;
    CheckBox2: TCheckBox;
    GroupBox4: TPanel;
    cxPageControl6: TcxPageControl;
    cxTabSheet16: TcxTabSheet;
    cxTabSheet17: TcxTabSheet;
    Label6: TLabel;
    DBLkCBCampoOrigem: TcxDBLookupComboBox;
    Label12: TLabel;
    edittipoOrigem: TcxTextEdit;
    Label13: TLabel;
    edsizeOrigem: TcxSpinEdit;
    chkUDK: TCheckBox;
    cxGrid5: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    CDSOrigChave: TClientDataSet;
    DSOrigChave: TDataSource;
    cxGridDBTableView5nome: TcxGridDBColumn;
    cxGridDBTableView5CheckChave: TcxGridDBColumn;
    CDSOrigemCheckChave: TBooleanField;
    btnGrava: TBitBtn;
    BitBtn9: TBitBtn;
    CDSOrigChaveid: TIntegerField;
    CDSOrigChavenome: TStringField;
    CDSOrigChavenomeTipo: TStringField;
    CDSOrigChavenumTipo: TIntegerField;
    CDSOrigChavesize: TIntegerField;
    CDSOrigChaveTabela: TStringField;
    CDSOrigChaveCheckChave: TBooleanField;
    chkRtftoText: TcxCheckBox;
    procedure cbSistemaPropertiesCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btntituloClick(Sender: TObject);
    procedure DBLKCBOrigemPropertiesCloseUp(Sender: TObject);
    procedure DBLKCBDestinoPropertiesCloseUp(Sender: TObject);
    procedure DBLkCBCampoOrigemPropertiesCloseUp(Sender: TObject);
    procedure DBLkCBCampoDestinoPropertiesCloseUp(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure NovoProjeto1Click(Sender: TObject);
    procedure AbrirProjeto1Click(Sender: TObject);
    procedure btnEcecutarClick(Sender: TObject);
    procedure cxRGSequenciaPropertiesChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CRDBGrid1DblClick(Sender: TObject);
    procedure cxDBTextEdit6Exit(Sender: TObject);
    procedure cxDBTextEdit7Exit(Sender: TObject);
    procedure cxComboBox1PropertiesCloseUp(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Deletarregistro1Click(Sender: TObject);
    procedure DBLkCBCampoOrigemPropertiesInitPopup(Sender: TObject);
    procedure DBLkCBCampoDestinoPropertiesInitPopup(Sender: TObject);
    procedure CHKAssociarClick(Sender: TObject);
    procedure CBconexaoselPropertiesCloseUp(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ChkBWhereClick(Sender: TObject);
    procedure RGWherePropertiesChange(Sender: TObject);
    procedure ChkBCaracteresClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure chkprimarykeyClick(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure lkptabelasPropertiesEditValueChanged(Sender: TObject);
    procedure lkbarquivoscrpPropertiesEditValueChanged(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ChkLimitarClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure DeletarScript1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure rdgtipoexecPropertiesChange(Sender: TObject);
    procedure sporigemClick(Sender: TObject);
    procedure spdestinoClick(Sender: TObject);
    procedure acExecsqlscrExecute(Sender: TObject);
    procedure acEcluirregExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure btndescartaClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure DeletarCombinao1Click(Sender: TObject);
    procedure EditarCombinao1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnlimparClick(Sender: TObject);
    procedure EdiotordeConsultasSql1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure cxTabSheet17Show(Sender: TObject);

  private
    { Private declarations }
    FNomearq: string;
    FStrList: TStringList;
    Fsistemaid: string;
    Fsiglatabela: string;
    Fpathged: string;
    Flocal: string;
    FProjeto: TFileName;
    FPRJID: Int64;
    FsArquivo:  TextFile;
    FArquivoSql: string;
    Fpahtexe: string;
    FShadow: TShadowForm;
    FTodas: Boolean;
    FlistaRecentes: TStringList;
    vItem: TMenuItem;
    FTempdir: string;
    Ftmh: Integer;
    Fsequencia: Integer;
    FCHAVESOFTWIK: string;
    Ftestar: Boolean;
    FLstudk: string;
    function conectar: boolean;
    function SalvaConexao: boolean;
    procedure atualizastatus(sts: string);
    function formatadatatimesql(adt: Tdatetime): string;
    function retnull(adt: string): string;
    function tratadouble(doub: double): string;
    function tratadoubleD(doub: double): double;
    procedure CcnDestinoAfterDisconnect(Sender: TObject);
    procedure CcnDestinoAfterConnect(Sender: TObject);
    procedure CcnOrigemAfterConnect(Sender: TObject);
    procedure CcnOrigemAfterDisconnect(Sender: TObject);
    procedure conectaorigem(pNova:boolean=false);
    function IniciaConexao :boolean;
    function StrRetnull(val: string): string;
    function retSequencia(seqnome: string): string;
    function Retornatipofield(pStrtyp: String): TFieldType;

    function Retsqlstr(vst: string;Vclsp : Tinfofield): string;
    function Retsqlint(vst: string): string;
    function Retsqldouble(vst: string): string;
    function Retsqldatetime(vst: string; Vclsp : Tinfofield): string;
    function Retsqlboll(vst: string): string;
    procedure filtratipo(filtro:string);
    procedure atualizabotao(Sender: TObject);
    procedure verificagrava;
    function verificaSubstituicao(Vclsp : Tinfofield): string;
    function abrirFilhos:boolean;
    procedure resetgeral;
    function FormataSqlTipoCampo(pValor: string;vtipo:TFieldType;vclsp:Tinfofield): String;
    function SubselectSqlRotina(pValor: string; Vclsp : Tinfofield): string;
    procedure IniciaArquivo(tabela: string);
    procedure gravaProjeto(pNome_Arquivo:string;Tipo:string='S';pTabOrigem:string='';pTabDestino:string='';pSQL:string='');
    function RetiraEnter(aText: string): string;
    procedure whererotina(idx: integer);
    function criacamponovo(tabela, campo, tipo: string): string;

    function Sincronizasequencia(pTabela,pCampo:string):string;
    procedure atualizascriptscds;
     procedure WMMove(var Message: TWMMove); message WM_MOVE;
    function sombra(tipo:Ttipoacao=sbCrt; frase:string=''): TShadowForm;
    procedure gravarecente(arquivo: string);
    procedure LerRecentes;

    function CrimenuRecentes(menu:string;Item:TMenuItem=nil;vclick:boolean = true):TMenuItem;
    procedure clickmenurecetntes(Sender: TObject);
    procedure AbreArquivoprojeot(projeto: string;criaprojeto:boolean=false);
    procedure gerabakcupdb;
    function TrataParametros(Sql: string): String;
    procedure GeraUpdateObsGEral;
    function RetornaValorWhere(vTexto, vSource, vValor: string;clsp: Tinfofield=NIL): string;
    function executeScriptTable: boolean;
    procedure MsgAlerta(msg:string;caption:string='P');
    procedure MsgAviso(msg:string;caption:string='P');
    procedure MsgErro(msg:string;caption:string='P');
    function MsgPerguntaOkCacel(msg:string;caption:string='P'): boolean;
    procedure DeletaAssociacao;
    procedure Gravadadosimportado(clsp: Tinfofield);
    function RetornaPersonalWere(vcls:Tinfofield=nil): string;
    function tratavalores(clsp: Tinfofield): Variant;
    procedure ExecucaoManual;
    procedure inserememo;
    procedure postastatus(s:string;reseta:boolean = false);
    function validadatahora(vst: string; Vclsp: Tinfofield): boolean;
    function verificaCriasequencia: boolean;
    function substituivariaveis(vclsp: Tinfofield): string;
    function HashcodeDefault(clsp: Tinfofield): string;
    procedure updatechaves(TabO, TabD, ValorCh: string; tiopo: TtipoChave);
    function FormataValoropc(str:string;clsp: Tinfofield=NIL):string;
    function RetornaPersonalWerenovo(vcls: Tinfofield= nil): string;
    function TrataParametrosgeral(campodestino, Sql: string): String;
    function HashcodeDefaultComparacoes: string;
    procedure DeletaAssociacaoGeral(origem, destino: string);
    function criaTabelaControle: string;
    function crianovosCampos(tabela,campo:string;vtipocampo:TFieldType;vtamanho:integer=0): string;
    procedure setaconexaoeditor;
    function verificaSubstituicaoAuto(clsp: Tinfofield): String;
    function SomaCamapos(clspS: Tinfofield): double;
    function pegaGeracaoChave(TbO,TbD:string): String;
    function RichTextToPlainText(richText: string): string;

  public
    { Public declarations }

  end;

var
  GeradorScript: TGeradorScript;
 CONST
   vFiltros : array [0..2] of TChars = (['#'],['A'..'Z','a'..'z'],['0'..'9']);
implementation

{$R *.dfm}

uses untDatamodule,inifiles,math,TypInfo, SqlEditor;

function TGeradorScript.sombra(tipo:Ttipoacao=sbCrt; frase:string=''):TShadowForm;
procedure criashadow;
begin
  if FShadow = nil then
    FShadow := TShadowForm.CreateShadow(Self);
end;
begin
  //postastatus('Testando a sombra');
//  if DebugHook <> 0 then exit;
  try
    case tipo of
      sbCrt :
      begin
        FShadow := TShadowForm.CreateShadow(Self);
        FShadow.UpdateShadow;
      end;
      sbUp:
      begin
        //FShadow.UpdateShadow(frase);
        FShadow.UpdateShadow;
      end;
      sbFree:
      begin
        FShadow.Free;
        FShadow := nil;
      end;

    end;
    // postastatus('',true);
  except
   criashadow;
  end;



end;

procedure TGeradorScript.spdestinoClick(Sender: TObject);
begin
  updatechaves(DBLKCBOrigem.Text, DBLKCBDestino.Text, cbxkeyfield.Text,tcDestino);
end;

function isdatavalida(Data :TdateTime):boolean;
 var
  A,
  M,
  D: Word;
begin
  decodedate(Data,A,M,D);
  Result := IsValidDate(A,M,D);
end;


function TGeradorScript.criaTabelaControle:string;
begin
  Result := 'IF (NOT EXISTS(SELECT 1 AS RESULT from RDB$RELATION_FIELDS RF WHERE rf.RDB$RELATION_NAME = '+quotedstr('TEMP_INSERT')+')) THEN EXECUTE STATEMENT '+quotedstr('CREATE TABLE  TEMP_INSERT (INTMP INTEGER)');
end;

function TGeradorScript.criacamponovo(tabela,campo,tipo:string):string;
begin
  Result := 'IF (NOT EXISTS(SELECT 1 AS RESULT from RDB$RELATION_FIELDS RF WHERE rf.RDB$RELATION_NAME = '+quotedstr(tabela)+ ' AND RF.RDB$FIELD_NAME = '+quotedstr(campo)+')) THEN EXECUTE STATEMENT '+quotedstr('ALTER TABLE  '+tabela+' ADD '+campo+' '+tipo);
end;

function TGeradorScript.crianovosCampos(tabela,campo:string;vtipocampo:TFieldType;vtamanho:integer=0):string;
var
  vTfield: string;
begin
  vTfield := '';
  case vtipocampo of
    ftSmallint, ftInteger, ftWord, ftLargeint,
    ftLongWord, ftShortint, ftByte :          vTfield := ' NUMERIC(15,2)';
    ftString, ftMemo, ftWideMemo,ftVarBytes:  vTfield := ' VARCHAR('+IntToStr(vtamanho+100)+')';
    ftFloat, ftCurrency, ftBCD:               vTfield := ' NUMERIC(15,2)';
    ftDate, ftTime, ftDateTime,ftTimeStamp:   vTfield := ' TIMESTAMP';
    ftBlob:                                   vTfield := ' BLOB ';
  end;
  Result := 'IF (NOT EXISTS(SELECT 1 AS RESULT from RDB$RELATION_FIELDS RF WHERE rf.RDB$RELATION_NAME = '+quotedstr(tabela)+ ' AND RF.RDB$FIELD_NAME = '+quotedstr(campo)+')) THEN EXECUTE STATEMENT '+quotedstr('ALTER TABLE  '+tabela+' ADD '+campo+' '+vTfield);
end;



function FilterChars(const S: string; const ValidChars: TChars): string;
var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  if S[I] in ValidChars then
  Result := Result + S[I];
end;




procedure TGeradorScript.BitBtn1Click(Sender: TObject);
var
  conv :integer;
  I: Integer;
  vCAMPOCRIAR: Boolean;
  vtipocampo: TFieldType;
  vTfield: string;
  const
    sistemaid : array [0..6] of integer = (999,1,2,5,7,12,13);
begin
 vCAMPOCRIAR := FALSE;
  try
    if cbxkeyfield.ItemIndex = -1 then
    begin
      ShowMessage('Chave primaria não selecionada.');
      exit;
    end;

    if ((DBLkCBCampoOrigem.EditText <> '') and (DBLkCBCampoDestino.EditText <> '')) then
    begin
      vtipocampo := (Retornatipofield(CDSDestinonomeTipo.Value));
      vCAMPOCRIAR:= (vtipocampo = ftUnknown);
      vtipocampo := (Retornatipofield(CDSOrigemnomeTipo.Value));
      if ((not vCAMPOCRIAR) and (dm.QryParametros.locate('CAMPO_DESTINO;CAMPO_ORIGEM',VarArrayOf([CDSDestinonome.AsString,CDSOrigemnome.AsString]),[]))) then
      begin
        if dm.MsgPerguntaSimNao('Já existe uma associação do campo '+CDSDestinonome.AsString+' com '+CDSOrigemnome.AsString+' outro deseja substituir essa associação?',application.Title) then
          DeletaAssociacao
        else
          exit;
      end;
      vTfield := '';

      I := 0;

      conv :=  Round(random(99999));
      dm.QryParametros.Append;
      dm.QryParametrosID.Value                          := conv;
      dm.QryParametrosSISTEMA.Value                     := cbSistema.EditText;
      dm.QryParametrosID_PROJETO.Value                  := FPRJID;                                       //  999  1  2    5   7  12  13
      dm.QryParametrosSISTEMAID.Value                   := sistemaid[IndexText(copy(cbSistema.EditText,1,1),['G','R','T','C','D','V','P'])];
      dm.QryParametrosBANCO_ORIGEM.AsString             := DM.CcnOrigem.Database;
      DM.QryParametrosBANCO_DESTINO.AsString            := DM.CcnDestino.Database;
      dm.QryParametrosTABELA_ORIGEM.Value               := CDSOrigemTabela.AsString;
      dm.QryParametrosTABELA_DESTINO.Value              := CDSDestinoTabela.AsString;
      dm.QryParametrosIDX_CAMPO_ORIGEM.Value            := CDSOrigemid.Value;
      dm.QryParametrosIDX_CAMPO_DESTINO.Value           := IFTHEN(vCAMPOCRIAR,1000, CDSDestinoidxcampo.Value);
      dm.QryParametrosCAMPO_ORIGEM.Value                := CDSOrigemnome.Value;
      dm.QryParametrosCAMPO_DESTINO.Value               := IFTHEN(vCAMPOCRIAR,CDSOrigemnome.Value,CDSDestinonome.Value);
      dm.QryParametrosTIPODADO_ORIGEM.Value             := CDSOrigemnomeTipo.Value;
      dm.QryParametrosTIPODADO_DESTINO.Value            := IFTHEN(vCAMPOCRIAR,CDSOrigemnomeTipo.Value,CDSDestinonomeTipo.Value);
      dm.QryParametrosTAM_CAMPO_ORIGEM.Value            := CDSOrigemsize.Value;
      dm.QryParametrosTAM_CAMPO_DESTINO.Value           := IFTHEN(vCAMPOCRIAR,CDSOrigemsize.Value,CDSDestinosize.Value);
      dm.QryParametrosACEITA_NULL.Value                 := (CDSDestinoAceita_Null.Value);
      dm.QryParametrosGERAR_VALOR.Value                 := (chkprimarykey.Checked);
      dm.QryParametrosTIPOVALOR_GERAR.Value             := cxRGSequencia.ItemIndex;
      dm.QryParametrosSEQUENCIA.AsString                := ifthen(cxRGSequencia.ItemIndex = 4,editSeqNOme.Text,'');
      dm.QryParametrosRETIRAR_ACENTOS.Value             := chkretacentos.Checked;
      dm.QryParametrosCONVETER_MAIUSCULO.Value          := chkmaiusculo.Checked;
      dm.QryParametrosVALOR_A_CONSIDERAR.Value          := math.ifthen(cxRGSequencia.ItemIndex = 4, integer(spnvalorSeqexpec.Value), integer(cxSEvalor.Value));
      dm.QryParametrosFILTRAR_CARACTERES.Value          := RDXFiltrar.ItemIndex;
      dm.QryParametrosAJUSTAR_TAMANHO.Value             := chkAjustar.Checked;
      dm.QryParametrosRTFTOTEXT.Value                   := chkRtftoText.Checked;
      dm.QryParametrosUSAR_COMO_WHERE.Value             := ChkBWhere.Checked;
      dm.QryParametrosCHAVE_PRIMARIA_DESTINO.AsString   := cbxkeyfield.Text;
      dm.QryParametrosCHAVE_PRIMARIA_ORIGEM.AsString    := cbxkeyfieldOrigem.Text;
      dm.QryParametrosTCAMPO.AsString                   := IFTHEN(vCAMPOCRIAR,'CRA','NOR');
      dm.QryParametrosDEFAULT_VALOR.AsString            := EdtDefaultValor.Text;
      if (chkprimarykey.Checked) then
        dm.QryParametrosCOMPORCHAVEDEFAULT.Value        := false
      else
        dm.QryParametrosCOMPORCHAVEDEFAULT.Value        := chkUDK.Checked;
      if ChkBCaracteres.Checked then
         dm.QryParametrosCARACTERES_REMOVER.AsString := EdtCaracteres.Text;
      if CHKAssociar.Checked then
      begin
        if trim(sqlmemoAssocD.Lines.Text) <> '' then
           dm.QryParametrosPERSONAL_SELECT.Text      := StringReplace(StringReplace(sqlmemoAssocD.Lines.Text,#10,' ',[rfReplaceAll]),#13,' ',[rfReplaceAll])+' [D]';
        if trim(sqlmemoAssocO.Lines.Text) <> '' then
           dm.QryParametrosPERSONAL_SELECT.Text      := StringReplace(StringReplace(sqlmemoAssocO.Lines.Text,#10,' ',[rfReplaceAll]),#13,' ',[rfReplaceAll])+' [O]';
      end;
      dm.QryParametros.Post;
      dm.QryParametros.ApplyUpdates();

      if CHKAssociar.Checked then
      begin
        if ((trim(sqlmemoAssocD.Lines.Text) <> '') or (trim(sqlmemoAssocO.Lines.Text) <> '')) then
        begin
          dm.QrySubstQueries.Append;
          dm.QrySubstQueriesID.Value                := Round(random(99999));
          dm.QrySubstQueriesID_CONVERSAO.Value      := conv;
          dm.QrySubstQueriesTABELA_ORIGEM.Value     := CDSOrigemTabela.AsString;
          dm.QrySubstQueriesTABELA_DESTINO.Value    := CDSDestinoTabela.AsString;
          dm.QrySubstQueriesTIPO_CAMPO.Value        := CDSOrigemnomeTipo.Value;
          dm.QrySubstQueriesCAMPO.Value             := CDSDestinonome.Value;
          if trim(sqlmemoAssocD.Lines.Text) <> '' then
          begin
            dm.QrySubstQueriesROTINA_SQL.Text      := StringReplace(StringReplace(sqlmemoAssocD.Lines.Text,#10,' ',[rfReplaceAll]),#13,' ',[rfReplaceAll]);
            dm.QrySubstQueriesREFERENTE.Value := 'D';
          end;
          if trim(sqlmemoAssocO.Lines.Text) <> '' then
          begin
            dm.QrySubstQueriesROTINA_SQL.Text      := StringReplace(StringReplace(sqlmemoAssocO.Lines.Text,#10,' ',[rfReplaceAll]),#13,' ',[rfReplaceAll]);
            dm.QrySubstQueriesREFERENTE.Value := 'O';
          end;
          dm.QrySubstQueries.Post;
          dm.QrySubstQueries.ApplyUpdates();
        end;
      end else
      if ((valueSubs.Values[valueSubs.Keys[0]]<> '') OR (valueSubs.Values[valueSubs.Keys[1]] <> '')) then
      begin
        for I := 1 to valueSubs.RowCount - 1 do
        begin
          dm.QrySubstQueries.Append;
          dm.QrySubstQueriesID.Value                := Round(random(99999));
          dm.QrySubstQueriesID_CONVERSAO.Value      := conv;
          dm.QrySubstQueriesTABELA_DESTINO.Value    := CDSDestinoTabela.AsString;
          dm.QrySubstQueriesTABELA_ORIGEM.Value     := CDSOrigemTabela.AsString;
          dm.QrySubstQueriesTIPO_CAMPO.Value        := CDSOrigemnomeTipo.Value;
          dm.QrySubstQueriesCAMPO.Value             := CDSDestinonome.Value;
          dm.QrySubstQueriesVALOR_ORIGEM.AsString   := valueSubs.Keys[I];
          dm.QrySubstQueriesVALOR_DESTINO.AsString  := valueSubs.Values[valueSubs.Keys[I]];
          dm.QrySubstQueries.Post;
          dm.QrySubstQueries.ApplyUpdates();
        end;

      end;

      if (vCAMPOCRIAR) then
      begin

        case vtipocampo of
          ftSmallint, ftInteger, ftWord, ftLargeint,
          ftLongWord, ftShortint, ftByte :          vTfield := ' NUMERIC(15,2)';
          ftString, ftMemo, ftWideMemo,ftVarBytes:  vTfield := ' VARCHAR('+IntToStr(CDSOrigemsize.AsInteger+100)+')';
          ftFloat, ftCurrency, ftBCD:               vTfield := ' NUMERIC(15,2)';
          ftDate, ftTime, ftDateTime,ftTimeStamp:   vTfield := ' TIMESTAMP';
          ftBlob:                                   vTfield := ' BLOB ';
        end;

        dm.QryPersonalFields.Append;
        dm.QryPersonalFieldsID.Value              := Round(random(99999));
        dm.QryPersonalFieldsID_PROJETO.Value      := FPRJID;
        dm.QryPersonalFieldsPERSONAL_CAMPO.Value  := CDSOrigemnome.Value;
        dm.QryPersonalFieldsTIPO_CAMPO.Value      := CDSOrigemnomeTipo.Value;
        dm.QryPersonalFieldsTABELA_ORIGEM.Value   := CDSOrigemTabela.AsString;
        dm.QryPersonalFieldsTABELA_DESTINO.Value  := CDSDestinoTabela.AsString;
        dm.QryPersonalFieldsROTINA_SQL.Value      := criacamponovo(CDSDestinoTabela.Value ,CDSOrigemnome.Value,vTfield);
        dm.QryPersonalFields.Post;
        dm.QryPersonalFields.ApplyUpdates();
      end;

      if ChkBWhere.Checked then
      begin
        dm.QryPERSONALWHERES.Append;
        dm.QryPERSONALWHERESID.Value                := Round(random(99999));
        dm.QryPERSONALWHERESID_PROJETO.Value        := FPRJID;
        dm.QryPERSONALWHERESTABELA_DESTINO.Value    := CDSDestinoTabela.AsString;
        dm.QryPERSONALWHERESTABELA_ORIGEM.Value     := CDSOrigemTabela.AsString;
        dm.QryPERSONALWHERESROTINA_SQL.AsString     := MmWhere.Lines.Text;
        dm.QryPERSONALWHERESCAMPO_WHERE.AsString    := CDSOrigemnome.Value;
        dm.QryPERSONALWHERESTIPO_CAMPOWHR.AsString  := CDSOrigemnomeTipo.Value;
        dm.QryPERSONALWHERESSE_EXISTE.AsString      := ifthen(RGWhere.ItemIndex = 0,'S','N');
        dm.QryPERSONALWHERESCOMPARACOES.AsString    := ReplaceStr(memocondicao.Lines.Text,'  ',' ');
        dm.QryPERSONALWHERES.Post;
        dm.QryPERSONALWHERES.ApplyUpdates();
      end;
      dm.QryParametros.ExecSQL;

      gerabakcupdb;
    end;
  finally
    resetgeral;
  end;


end;

procedure TGeradorScript.rdgtipoexecPropertiesChange(Sender: TObject);
begin
   pnlcomitt.Visible :=  rdgtipoexec.ItemIndex = 0;
end;

procedure TGeradorScript.resetgeral;
begin
  try
    valueSubs.Strings.Clear;
    chkprimarykey.Checked := false;
    cxRGSequencia.ItemIndex := -1;
    edittipoDestino.clear;
    edsizeDestino.clear;
    edittipoOrigem.clear;
    edsizeOrigem.clear;
    sqlmemoAssocD.Lines.Clear;
    sqlmemoAssocO.Lines.Clear;
  //  ShowMessage('resentanto datasets');
    CDSCAMPOS_O.Close;
    CDSCAMPOS_O.Data := null;
    CDSCAMPOS_O.CreateDataSet;
    CDSCAMPOS_D.Close;
    CDSCAMPOS_D.Data := null;
    CDSCAMPOS_D.CreateDataSet;
    CHKAssociar.Checked := false;
    ChkBWhere.Checked := false;
   // ShowMessage('ponto2');
    MmWhere.Lines.clear;
    RGWhere.ItemIndex := -1;
    pageOpcoes.ActivePageIndex := 0;
    MmWhere.Enabled := false;
    chkretacentos.Checked := false;
    chkAjustar.Checked := false;
    chkmaiusculo.Checked := false;
    ChkBCaracteres.Checked := false;
    RDXFiltrar.ItemIndex := 0;
    cxpageopschar.ActivePageIndex := 0;
    TAbSeq.ActivePageIndex := 0;
    editSeqNOme.Clear;
    spnvalorSeqexpec.Value := 0;
    except on e: exception do
    begin
      showmessage('erro executando resentgeral'+ e.Message);
      raise;
    end;


  end;


end;

procedure TGeradorScript.BitBtn2Click(Sender: TObject);
begin
  dm.QryPersonalQuery.Open;
  formEditorSql:=TformEditorSql.AbreEditorSQL('','','','');
  if formEditorSql.FConfirmar then
  begin
    dm.QryPersonalQuery.Append;
    dm.QryPersonalQueryID.Value           := Round(random(99999));
    dm.QryPersonalQueryID_PROJETO.Value   := dm.QryProjetoID.Value;
    dm.QryPersonalQuerySISTEMA.AsString   := formEditorSql.cbSistema.EditText;
    dm.QryPersonalQueryQRY_TEXT.AsString  := formEditorSql.sqlmemo.Lines.Text;
    dm.QryPersonalQueryQRY_NOME.AsString  := 'Custon_'+formEditorSql.EdtNome.Text;
    dm.QryPersonalQueryQRY_OBS.AsString   := formEditorSql.MmObs.Lines.Text;
    dm.QryPersonalQuery.Post;
    dm.QryPersonalQuery.ApplyUpdates();
    gerabakcupdb;
  end;
  FreeAndNil( formEditorSql);
end;

procedure TGeradorScript.BitBtn3Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão desta query?','Exclusão',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    dm.QryPersonalQuery.Delete;
    dm.QryPersonalQuery.ApplyUpdates();
    gerabakcupdb;
  end;
end;

procedure TGeradorScript.BitBtn4Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?','Exclusão',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    DeletaAssociacao;
  end;


end;

procedure TGeradorScript.BitBtn5Click(Sender: TObject);
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

procedure TGeradorScript.BitBtn6Click(Sender: TObject);
begin
  if not DirectoryExists(Editlocal.Text) then
    ForceDirectories(Editlocal.Text);
  try
    sombra(sbCrt,'Aguarde Gerando Scripts. ...');
    dm.Qry_ScriptArq.First;
    while not dm.Qry_ScriptArq.Eof do
    begin
      sombra(sbUp,'Grando arquivo :'+dm.Qry_ScriptArqID.AsString+'_'+dm.Qry_ScriptArqTABELA_DESTINO.AsString+'.sql');
      dm.Qry_ScriptArqSCRIPT_ARQ.SaveToFile(Editlocal.Text+'\'+dm.Qry_ScriptArqNOME_ARQUIVO.AsString+'.sql');
      dm.Qry_ScriptArq.Next;
    end;
  finally
    sombra(sbFree);
  end;
end;

procedure TGeradorScript.BitBtn7Click(Sender: TObject);
begin
  if trim(edtNomeScript.Text) = '' then
  begin
    ShowMessage('Defina um nome para o script.');
    exit;
  end;
  dm.QryScript.Open;
  gravaProjeto(trim(edtNomeScript.Text),'P','Script_D_'+trim(edtNomeScript.Text),'Script_D_'+trim(edtNomeScript.Text),editorsqlmemo.Lines.Text);
end;

procedure TGeradorScript.btnGravaClick(Sender: TObject);
 var
  chaudk :string;
begin
  chaudk :='';
  if not dm.QryC_ORDEM.IsEmpty then
      dm.QryC_ORDEM.Edit
  else
    dm.QryC_ORDEM.Append;
  dm.QryC_ORDEMID.Value := Round(random(99999));
  dm.QryC_ORDEMTABELA_ORIGEM.AsString := CDSOrigemTabela.AsString;
  dm.QryC_ORDEMTABELA_DESTINO.AsString := CDSDestinoTabela.AsString;
  dm.QryC_ORDEMID_PROJETO.Value := FPRJID;
  CDSOrigChave.DisableControls;
  CDSOrigChave.First;
  while not CDSOrigChave.Eof do
  begin
    chaudk:= ifthen(chaudk='',trim(CDSOrigChavenome.AsString)+'='+BoolToStr(CDSOrigChaveCheckChave.AsBoolean),chaudk+#13+trim(CDSOrigChavenome.AsString)+'='+BoolToStr(CDSOrigChaveCheckChave.AsBoolean));
    CDSOrigChave.Next;
  end;
  dm.QryC_ORDEMORIGEM_G_CHAVE.Value := chaudk;
  CDSOrigChave.EnableControls;
  dm.QryC_ORDEM.Post;
  if dm.QryC_ORDEM.UpdatesPending then
    dm.QryC_ORDEM.ApplyUpdates();
end;

procedure TGeradorScript.BitBtn9Click(Sender: TObject);
var
  tsl :tstringlist;
  I: Integer;
  linha :string;
begin
  I := 0;
  tsl :=tstringlist.Create;
  try
    tsl.Text := pegaGeracaoChave(CDSOrigemTabela.AsString,CDSDestinoTabela.AsString);
    if tsl.Count > 0 then
    for I := 0 to pred(tsl.Count) do
    begin
      linha :=  SplitString(tsl.Strings[I],'=')[0];
      if CDSOrigChave.Locate('nome',linha,[])then
      begin
        CDSOrigChave.Edit;
        CDSOrigChaveCheckChave.Value := StrToBool(SplitString(tsl.Strings[I],'=')[1]);
        CDSOrigChave.Post;
      end;
    end;
  finally
    btnGrava.Enabled := true;
    FreeAndNil(tsl);
  end;
end;

procedure TGeradorScript.btnlimparClick(Sender: TObject);
begin
  dm.QryEditor.close;
  editorsqlmemo.Lines.Clear;
end;

procedure TGeradorScript.btntituloClick(Sender: TObject);
begin
  conectaorigem(true);
end;

function TGeradorScript.verificaSubstituicao(Vclsp:Tinfofield):string;

begin

  Result := VarToStr(Vclsp.ValOrg);
  if VarToStr(Vclsp.ValOrg) = '' then
    Result := 'NULL';
  if not dm.QrySubstQueriesins.IsEmpty then
  begin
    if dm.QrySubstQueriesinsROTINA_SQL.AsString = '' then
      if dm.QrySubstQueriesins.Locate('VALOR_ORIGEM',VarToStr(Vclsp.ValOrg),[]) then
        Result :=   FormataSqlTipoCampo(dm.QrySubstQueriesinsVALOR_DESTINO.AsString,Vclsp.FTipoDst,Vclsp)
      else
        Result := 'NULL';
  end;
end;


procedure TGeradorScript.IniciaArquivo(tabela:string);
begin
   FArquivoSql :=tabela;
   AssignFile(FsArquivo, tabela);
  if FileExists(tabela) then
    DeleteFile(tabela);
  ReWrite(FsArquivo);
  if ChkLimitar.Checked then
    Ftmh:= FileSize(FsArquivo);

end;


function TGeradorScript.verificaCriasequencia:boolean;
var
  sql :string;
begin
  Result := true;
  try
    dm.QryChecaSeq.close;
    dm.QryChecaSeq.RestoreSQL;
    dm.QryChecaSeq.AddWhere('CV.TABELA_ORIGEM = '+Quotedstr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
    dm.QryChecaSeq.AddWhere('CV.TABELA_DESTINO = '+Quotedstr(dm.QryExecuteparamTABELA_DESTINO.AsString));
    dm.QryChecaSeq.Open;
    if not dm.QryChecaSeq.IsEmpty then
    begin
      dm.QryChecaSeq.First;
      while not dm.QryChecaSeq.Eof do
      begin
         sql    := (' execute block  '+#13+
                    ' as  '+#13+
                    ' declare variable V_COUNT integer; '+#13+
                    ' begin '+#13+
                    ' SELECT COUNT(*) FROM G_SEQUENCIA WHERE TABELA = '+quotedstr(dm.QryChecaSeqSEQUENCIA.AsString)+' INTO :V_COUNT; '+#13+
                    ' if (:V_COUNT <= 0) then '+#13+
                    '  insert into G_SEQUENCIA (TABELA, SEQUENCIA) values ('+quotedstr(dm.QryChecaSeqSEQUENCIA.AsString)+', '+dm.QryChecaSeqVALOR_A_CONSIDERAR.AsString+'); '+#13+
                    ifthen(dm.QryChecaSeqVALOR_A_CONSIDERAR.Value > 0,
                    ' else '+#13+
                    '   update g_sequencia SET SEQUENCIA = '+dm.QryChecaSeqVALOR_A_CONSIDERAR.AsString+' where TABELA = '+quotedstr(dm.QryChecaSeqSEQUENCIA.AsString)+';',
                    '')+#13+
                    ' end ');
        DM.Executasql(sql);
        dm.QryChecaSeq.Next;
      end;
    end;
  except

    raise;
  end;
end;




function TGeradorScript.Sincronizasequencia(pTabela,pCampo:string):String;
begin
  // if Application.MessageBox(Pchar('Executou refresh no destino criando as fks e pks ?'), 'Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
  // exit;
  // dm.QryRelationship.open;
  // dm.QryRelationship.first;
  // while not dm.QryRelationship.eof do
  // begin
  // if dm.QryRelationshipTABNOME.ASSTRING <> 'G_SEQUENCIA' then
  // BEGIN
  // DM.GerarSequencia(dm.QryRelationshipTABNOME.ASSTRING);
  Result := (' execute block  '+#13+
             ' as  '+#13+
             ' begin '+#13+
             ' if(EXISTS(SELECT 1 FROM G_SEQUENCIA WHERE TABELA = '+quotedstr(pTabela)+')) then update g_sequencia SET SEQUENCIA = COALESCE((SELECT MAX('+pCampo+') FROM '+pTabela+'),0) where TABELA = '+quotedstr(pTabela)+';'#13+
             ' end ');

  // dm.QryGRelationship.next;

  // end;
end;

procedure TGeradorScript.inserememo;
begin
   if AdvMemo1.Lines.Count > 0 then
     AdvMemo1.Lines.Add('--------------------------------------------------------------------------------');
   AdvMemo1.Lines.Add('Row Numero..................:'+dm.QrySelect.RecNo.ToString);
   AdvMemo1.Lines.Add('Atualizando dados de........:'+dm.QryParaminsTABELA_ORIGEM.AsString +' Para '+dm.QryParaminsTABELA_DESTINO.AsString);
   AdvMemo1.Lines.Add('Tipo Campo Origem...........: '+dm.QryParaminsTIPODADO_ORIGEM.AsString);
   AdvMemo1.Lines.Add('Tipo Campo Destino..........: '+dm.QryParaminsTIPODADO_DESTINO.AsString);
   AdvMemo1.Lines.Add('Tamanho Campo Origem........: '+dm.QryParaminsTAM_CAMPO_ORIGEM.AsString);
   AdvMemo1.Lines.Add('Tamanho Campo Destino.......: '+dm.QryParaminsTAM_CAMPO_DESTINO.AsString);
   IF dm.QryParaminsTCAMPO.AsString <> 'DEF' then
     AdvMemo1.Lines.Add('Valor Campo Origem..........: '+dm.QrySelect.FieldByName(dm.QryParaminsCAMPO_ORIGEM.AsString).AsString);
   AdvMemo1.Lines.Add('Nome Campo Origem...........: '+dm.QryParaminsCAMPO_ORIGEM.AsString);
   AdvMemo1.Lines.Add('Nome Campo Destino..........: '+dm.QryParaminsCAMPO_DESTINO.AsString);

   // AdvMemo1.Lines.Add('Tipo Field Origem     :'+dm.QryParaminsTIPODADO_ORIGEM.AsString);
   // AdvMemo1.Lines.Add('Tipo Field Origem     :'+dm.QryParaminsTIPODADO_ORIGEM.AsString);
end;

function TGeradorScript.executeScriptTable:boolean;
var
  vInicio: string;
  vLinha: string;
  vsinsert: string;
  vFields: string;
  vFieldsPAR: string;
  clsp: Tinfofield;
  vstlLinha: TStringlist;
  vWherePers: string;
  vCommitt: Integer;
  vExist: Boolean;
  vupdate: string;
  vfieldsupdate: string;
  vswhere: string;
  vupWere: string;
  vCampdoApp: string;
  VcampoChave: string;
  vChaveDesult: string;
  vcomitado: Integer;
  vcomitcont: Integer;
  vcampo: string;
  Ftestar: Boolean;
  vprefixotab: string;
  vseqtratada: string;

  function Resetavariaveis:boolean;
  begin
  end;

  function verificainsert:boolean;
  var
    vSubist : boolean;
  begin
    Result := false;
    vSubist := dm.QrySubstQueriesins.Locate('CAMPO',dm.QryParaminsCAMPO_DESTINO.AsString,[]);
    if (dm.QryParaminsDEFAULT_VALOR.AsString <> '') then
       Result := true
    else
    if (dm.QryParaminsTCAMPO.ASSTRING <> 'DEF') then
      Result := ((dm.QrySelect.FieldByName(dm.QryParaminsCAMPO_ORIGEM.AsString).AsString <> '')  or ((dm.QryParaminsPERSONAL_SELECT.AsString <> '') or (dm.QryParaminsGERAR_VALOR.AsBoolean))or vSubist)
    else
      Result := true;
  end;
begin
  vseqtratada := '';
  vprefixotab := '';
  vcampo := '';
  vcomitcont := 0;
  vcomitado := 0;
  vChaveDesult := '';
  VcampoChave := '';

  vCampdoApp := '';
  vupWere := '';
  vswhere := '';
  vfieldsupdate := '';
  vupdate := '';
  vExist := false;
  vCommitt := 0;
  vWherePers := '';
  vFieldsPAR := '';
  vFields := '';
  vsinsert := '';
  vLinha := '';
  vInicio := '';
  memoscript.Lines.Clear;
  try
    dm.QryExecuteparamORDEM_EXEC.ReadOnly := true;
    postastatus('Iniciando processo por table');
    sombra(sbUp,'Executando Filtros');
    try
      sombra(sbCrt,'Inserindo dados aguarde. ...');

      postastatus('Iniciando o while dos parametros');
      dm.QryExecuteparam.First;
      while not dm.QryExecuteparam.eof do
      begin
        if (dm.QryExecuteparamORDEM_EXEC.AsInteger <= 0) then
        begin
          dm.QryExecuteparam.Next;
          Continue;
        end;

         if (( dm.QryExecuteparamMARCADO.AsInteger = 0)) then
         begin
           dm.QryExecuteparam.Next;
           Continue;
         end;
         Fsequencia := -1;

        dm.QryScript.Close;
        dm.QryScript.RestoreSQL;
        dm.QryScript.DeleteWhere;
        dm.QryScript.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryExecuteparamTABELA_DESTINO.AsString));
        dm.QryScript.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
        dm.QryScript.Open;

        memoscript.Lines.Add('Iniciado merge dos dados ...');
        memoscript.Lines.Add('Origem dos Dados  :'+ dm.QryExecuteparamTABELA_ORIGEM.AsString );
        memoscript.Lines.Add('Destino dos Dados :'+ dm.QryExecuteparamTABELA_DESTINO.AsString );


       // IniciaArquivo(dIRoPERACAO+dm.QryExecuteparamTABELA_DESTINO.AsString+'.SQL');
       // vwheres := '';
        Application.ProcessMessages;
        dm.QryPersQueryExec.close;
        dm.QryPersQueryExec.RestoreSQL;
        dm.QryPersQueryExec.AddWhere(' QRY_NOME = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
        dm.QryPersQueryExec.Open;

        dm.QryPersonalFields.Close;
        dm.QryPersonalFields.RestoreSQL;
        dm.QryPersonalFields.DeleteWhere;
        dm.QryPersonalFields.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryExecuteparamTABELA_DESTINO.AsString));
        dm.QryPersonalFields.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
        dm.QryPersonalFields.Open;

        dm.QrySubstQueriesins.close;
        dm.QrySubstQueriesins.RestoreSQL;
        dm.QrySubstQueriesins.DeleteWhere;
        //dm.QrySubstQueriesins.AddWhere(' ID_CONVERSAO ='+dm.QryExecuteparamID.AsString);
        dm.QrySubstQueriesins.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryExecuteparamTABELA_DESTINO.AsString));
        dm.QrySubstQueriesins.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
        dm.QrySubstQueriesins.Open;

        dm.QryParamWhr.close;
        dm.QryParamWhr.RestoreSQL;
        dm.QryParamWhr.DeleteWhere;
        dm.QryParamWhr.AddWhere('SISTEMA = '+quotedstr(dm.QryExecuteparamSISTEMA.Value));
        dm.QryParamWhr.AddWhere('TABELA_DESTINO = '+quotedstr(dm.QryExecuteparamTABELA_DESTINO.Value));
        dm.QryParamWhr.AddWhere('TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
        dm.QryParamWhr.SetOrderBy('SISTEMA,TABELA_DESTINO,IDX_CAMPO_DESTINO');
        dm.QryParamWhr.Open;


        memoscript.Lines.Add('Sicronizando Sequencia');
        vprefixotab := copy(dm.QryExecuteparamTABELA_DESTINO.AsString,1,pos('_',dm.QryExecuteparamTABELA_DESTINO.AsString));
        vseqtratada := vprefixotab+ReverseString(copy(ReverseString(dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.asstring),pos('_',ReverseString(dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.asstring))+1,length(ReverseString(dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.asstring))));


       // Edit2.Text := copy(edit1.Text,1,pos('_',edit1.Text));
       // Edit2.Text := Edit2.Text+ReverseString(copy(ReverseString(Edit3.Text),pos('_',ReverseString(Edit3.Text))+1,length(ReverseString(Edit3.Text))));
        if (vseqtratada = dm.QryExecuteparamTABELA_DESTINO.AsString) then
        begin
          vLinha:= Sincronizasequencia(dm.QryExecuteparamTABELA_DESTINO.AsString,dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.asstring);
          dm.Executasql(vLinha);
        end;
        verificaCriasequencia;
        dm.QryPersonalFields.First;
        Application.ProcessMessages;
        vCampdoApp := criacamponovo(dm.QryExecuteparamTABELA_DESTINO.AsString,FCHAVESOFTWIK,'VARCHAR(1000)');
        vstlLinha := Tstringlist.Create;
        try
          sombra(sbUp,'Criando rotina de campos personalizados.');
          vstlLinha.Add(' execute block ');
          vstlLinha.Add(' as  ');
          vstlLinha.Add(' begin ');
          dm.QryParamWhr.Filter := 'TCAMPO = '+ QuotedStr('CRA');
          dm.QryParamWhr.Filtered := TRUE;
          {
          dm.QryPersonalFields.First;
          while not dm.QryPersonalFields.Eof do
          begin
            vstlLinha.Add(' '+dm.QryPersonalFieldsROTINA_SQL.AsString +';');
            AdvMemo1.Lines.Add(dm.QryPersonalFieldsROTINA_SQL.AsString +';');
            dm.QryPersonalFields.next;
          end;
         }
          dm.QryParamWhr.First;
          while not dm.QryParamWhr.Eof do
          begin
            vcampo := crianovosCampos(dm.QryParamWhrTABELA_DESTINO.AsString,dm.QryParamWhrCAMPO_ORIGEM.AsString,Retornatipofield(dm.QryParamWhrTIPODADO_ORIGEM.AsString),dm.QryParamWhrTAM_CAMPO_ORIGEM.AsInteger);
            vstlLinha.Add(' '+vcampo +';');
            AdvMemo1.Lines.Add(vcampo +';');
            dm.QryParamWhr.next;
          end;
          vstlLinha.Add(' '+vCampdoApp +';');
         // vstlLinha.Add(' '+criaTabelaControle+';');
          AdvMemo1.Lines.Add(vCampdoApp +';');
          vstlLinha.Add('END;');
          dm.Executasql(vstlLinha.Text);
        finally
          FreeAndNil(vstlLinha);
        end;
        dm.QryParamWhr.Filtered := FALSE;
        sombra(sbUp,'Verificando se tem condição pra inserir.');
        dm.QryPERSONALWHERES.Close;
        dm.QryPERSONALWHERES.RestoreSQL;
        dm.QryPERSONALWHERES.DeleteWhere;
        dm.QryPERSONALWHERES.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryExecuteparamTABELA_DESTINO.AsString));
        dm.QryPERSONALWHERES.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
        dm.QryPERSONALWHERES.Open;

        dm.QrySelect.Close;
        dm.QrySelect.SQL.Clear;
        if not dm.QryPersQueryExec.IsEmpty then
          dm.QrySelect.SQL.Text := dm.QryPersQueryExecQRY_TEXT.AsString
        else
          dm.QrySelect.SQL.Text := 'Select * from '+dm.QryExecuteparamTABELA_ORIGEM.AsString;
        dm.QrySelect.Open;
        dm.QrySelect.First;

        dm.QryParamins.close;
        dm.QryParamins.RestoreSQL;
        dm.QryParamins.DeleteWhere;
        dm.QryParamins.AddWhere('SISTEMA = '+quotedstr(dm.QryExecuteparamSISTEMA.Value));
        dm.QryParamins.AddWhere('TABELA_DESTINO = '+quotedstr(dm.QryExecuteparamTABELA_DESTINO.Value));
        dm.QryParamins.AddWhere('TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
        dm.QryParamins.SetOrderBy('SISTEMA,TABELA_DESTINO,IDX_CAMPO_DESTINO');
        dm.QryParamins.Open;

        if not dm.QryParamins.Locate('CAMPO_DESTINO',FCHAVESOFTWIK,[]) then
        begin
          dm.Criafieldhashdeful(FCHAVESOFTWIK);
          dm.QryParamins.ExecSQL;
        end;

        vsinsert := 'Select from  '+dm.QryExecuteparamTABELA_DESTINO.Value+'(';
        vupdate := ' UPDATE  '+dm.QryExecuteparamTABELA_DESTINO.Value+' SET ';
        vFields:='';
         sombra(sbUp,'Gerando mapa de fields.');

         vFieldsPAR := '';
         vfieldsupdate := '';
        dm.QryParamins.First;
        while not dm.QryParamins.Eof do
        begin
          Application.ProcessMessages;
          vFields:=ifthen(vFields='',dm.QryParaminsCAMPO_DESTINO.asstring,vFields+#13+','+dm.QryParaminsCAMPO_DESTINO.asstring);
          vFieldsPAR:=ifthen(vFieldsPAR='',':'+dm.QryParaminsCAMPO_DESTINO.asstring,vFieldsPAR+#13+',:'+dm.QryParaminsCAMPO_DESTINO.asstring);
          if dm.QryParaminsCAMPO_DESTINO.asstring <> dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.AsString then
            vfieldsupdate := ifthen(vfieldsupdate='',dm.QryParaminsCAMPO_DESTINO.asstring+' = :'+dm.QryParaminsCAMPO_DESTINO.asstring,
                                                   vfieldsupdate+','+dm.QryParaminsCAMPO_DESTINO.asstring+' = :'+dm.QryParaminsCAMPO_DESTINO.asstring)+#13;
          dm.QryParamins.Next;
          Application.ProcessMessages;
        end;
        if pos(FCHAVESOFTWIK, vFields) = 0 then
        begin
          vFields := vFields+#13+','+FCHAVESOFTWIK;
          vFieldsPAR := vFieldsPAR+#13+',:'+FCHAVESOFTWIK;
          vfieldsupdate := vfieldsupdate+','+FCHAVESOFTWIK+' = :'+FCHAVESOFTWIK;
        end;

        vstlLinha := Tstringlist.Create;
        vswhere := '  WHERE 1 = 0';
        if RdgOperacoes.ItemIndex > 0 then
        if dm.QryPersonalFields.Locate('PERSONAL_CAMPO','HASHCOD',[]) then
        begin
          VcampoChave := 'HASHCOD';
          vswhere := '  WHERE '+ifthen(dm.QryPERSONALWHERESSE_EXISTE.Value = 'N',' HASHCOD IS NOT NULL ',' HASHCOD IS NULL ');
          vupWere := '  WHERE '+#13+' HASHCOD = :HASHCOD';
        end else
        begin
          VcampoChave := FCHAVESOFTWIK;
          vswhere := '  WHERE '+#13+FCHAVESOFTWIK+' IS NOT NULL ';
          vupWere := '  WHERE '+#13+FCHAVESOFTWIK +'= :'+FCHAVESOFTWIK;
        end;



        dm.QryInsertTable.close;
        dm.QryInsertTable.sql.Clear;
        dm.QryInsertTable.DeleteWhere;
        dm.QryInsertTable.UpdatingTable   := dm.QryExecuteparamTABELA_DESTINO.AsString;
        dm.QryInsertTable.KeyFields       := dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.AsString;
        dm.QryInsertTable.SQLUpdate.Text  := vupdate+#13+vfieldsupdate+#13+vupWere;
        dm.QryInsertTable.SQLInsert.Text  := 'insert into  '+dm.QryExecuteparamTABELA_DESTINO.AsString +'('+#13+vFields+#13+') select '+#13+vFieldsPAR+' from rdb$database '+#13+' Where not Exists(Select '+dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.AsString+' from '+dm.QryExecuteparamTABELA_DESTINO.AsString+'  WHERE '+#13+FCHAVESOFTWIK +'= :'+FCHAVESOFTWIK+')';
        dm.QryInsertTable.SQL.Text        := ' SELECT '+vFields+' from  '+dm.QryExecuteparamTABELA_DESTINO.AsString +vswhere;
        dm.QryInsertTable.CachedUpdates   := TRUE;
        dm.QryInsertTable.OPEN;
        verificaCriasequencia;
        FLstudk := pegaGeracaoChave(dm.QryExecuteparamTABELA_ORIGEM.AsString,dm.QryExecuteparamTABELA_DESTINO.AsString);

        {
        dm.TblInsert.close;
        dm.TblInsert.TableName := dm.QryExecuteparamTABELA_DESTINO.AsString;
        dm.TblInsert.KeyFields := dm.QryExecuteparamCHAVE_PRIMARIA_DESTINO.AsString;
        dm.TblInsert.Open;
        }

        PgBarScript.Properties.Min := 0;
        PgBarScript.Properties.Max := dm.QrySelect.RecordCount;
        sombra(sbUp,'Grando Script :'+dm.QryExecuteparamTABELA_ORIGEM.AsString+' / '+dm.QryExecuteparamTABELA_DESTINO.AsString+'. Aguarde. ...');
        PgBarScript.Position := 0;
        vCommitt := 0;
        Fsequencia := -1;
        while not dm.QrySelect.Eof do
        begin
          vChaveDesult := '';
         // vChaveDesult := HashcodeDefaultComparacoes;

          lbrow.Repaint;
          clsp:= Tinfofield.Create;
          vChaveDesult :=HashcodeDefault(clsp);
          try
            Application.ProcessMessages;
            PgbarReg.Properties.Min := 0;
            PgbarReg.Properties.Max := dm.QryParamins.RecordCount;
            PgbarReg.Position := 0;
            vWherePers        := RetornaPersonalWere();
            clsp.WhereCheck   := vWherePers;
            clsp.RowNumero    := dm.QrySelect.RecNo;
            lbrow.Caption := ' Importando Registro '+ IntToStr(clsp.RowNumero)+' de '+floatToStr(PgBarScript.Properties.Max);
            if clsp.RowNumero = 303 then
             Ftestar := true;
            dm.QryParamins.First;

            if RdgOperacoes.ItemIndex = 0 then
            begin
              vExist:= dm.VerificaExiste(clsp.WhereCheck);
              case IndexStr(dm.QryPERSONALWHERESSE_EXISTE.AsString,['S','N']) of
                0: begin
                     if not vExist then
                     begin
                       PgBarScript.Position := PgBarScript.Position + 1;
                       FreeAndNil(clsp);
                       dm.QrySelect.Next;
                       continue;
                     end;
                end;
                1: begin
                     if vExist then
                     begin
                       PgBarScript.Position := PgBarScript.Position + 1;
                       FreeAndNil(clsp);
                       dm.QrySelect.Next;
                       continue;
                     end;
                end;
              end;

              dm.QryInsertTable.Append;
            end;
            case RdgOperacoes.ItemIndex of
              0: dm.QryInsertTable.Append;
              1: begin
                if dm.QryInsertTable.Locate(FCHAVESOFTWIK,vChaveDesult,[]) then
                  dm.QryInsertTable.Edit
                else
                  dm.QryInsertTable.Append;
                end;
              2:dm.QryInsertTable.Edit;
            end;

            PgbarReg.Position :=  0;
            dm.QryParamins.First;
            while not dm.QryParamins.Eof do
            begin
              Application.ProcessMessages;
              clsp.Resetavalores;
              clsp.WhereCheck   := vWherePers;

              if verificainsert then
              begin
               // if dm.QryParaminsCAMPO_DESTINO.AsString = 'QUANTIDADE_PAGINA' then
                // ShowMessage('');

                try
                  clsp.CampoDefault     := dm.QryParaminsTCAMPO.ASSTRING = 'DEF';
                  clsp.TipoOrg          := Retornatipofield(dm.QryParaminsTIPODADO_ORIGEM.AsString);
                  clsp.TipoDst          := Retornatipofield(dm.QryParaminsTIPODADO_DESTINO.AsString);
                  clsp.SizeOrg          := dm.QryParaminsTAM_CAMPO_ORIGEM.AsInteger;
                  clsp.SizeDst          := dm.QryParaminsTAM_CAMPO_DESTINO.AsInteger;
                  if not clsp.CampoDefault then
                  begin
                    if (dm.QrySelect.FieldByName(dm.QryParaminsCAMPO_ORIGEM.AsString).AsString = '') then
                       clsp.ValOrg         := ''
                    else
                       clsp.ValOrg         := dm.QrySelect.FieldByName(dm.QryParaminsCAMPO_ORIGEM.AsString).Value;
                  end;
                  clsp.Rotinasql        := dm.QryParaminsPERSONAL_SELECT.AsString;
                  clsp.ValorFuSqlPers   := dm.QryParaminsPERSONAL_SELECT.AsString;
                  if pos(' [',dm.QryParaminsPERSONAL_SELECT.AsString) > 0 then
                    clsp.Rotinasql_prm    := trim(copy(dm.QryParaminsPERSONAL_SELECT.AsString,1,pos(' [',dm.QryParaminsPERSONAL_SELECT.AsString)))
                  else
                    clsp.Rotinasql_prm    := dm.QryParaminsPERSONAL_SELECT.AsString;
                  if pos('SOMA',UpperCase(dm.QryParaminsPERSONAL_SELECT.AsString)) > 0 then
                    clsp.FCamposSomar    := COPY(dm.QryParaminsPERSONAL_SELECT.AsString,pos('SOMA(',UpperCase(dm.QryParaminsPERSONAL_SELECT.AsString))+5,pos(')',UpperCase(dm.QryParaminsPERSONAL_SELECT.AsString))-1);
                  clsp.CampoOrigem       := dm.QryParaminsCAMPO_ORIGEM.AsString;
                  clsp.CampoDestino      := dm.QryParaminsCAMPO_DESTINO.AsString;
                  clsp.ValorDefaultCampo := dm.QryParaminsDEFAULT_VALOR.AsString;
                  clsp.ChvPrimariaOrg    := dm.QryParaminsCHAVE_PRIMARIA_ORIGEM.AsString;
                  clsp.ChvPrimariaDes    := dm.QryParaminsCHAVE_PRIMARIA_DESTINO.AsString;
                  clsp.ValorPK           := dm.QryParaminsID.AsInteger;
                  clsp.IdCombinacao      := dm.QryParaminsID.AsInteger;
                  clsp.TabelaDestino     := dm.QryParaminsTABELA_DESTINO.AsString;
                  Gravadadosimportado(clsp);
                finally

                end;
              end;
               PgbarReg.Position := PgbarReg.Position + 1;
              dm.QryParamins.next;

            end;
            if (dm.QryInsertTable.FieldByName(dm.QryParaminsCHAVE_PRIMARIA_DESTINO.asstring).AsString <> '') then
            begin
              dm.QryInsertTable.Post;
              inc(vCommitt);
            end else
              dm.QryInsertTable.Cancel;

            if vCommitt >= cxSpEdtcomit.Value then
            begin
              inc(vcomitcont);
              memoscript.Lines.Add('-----------------------------------------');
              dm.StartTransaction;
              AdvMemo1.Lines.Add('Iniciando '+IntToStr(vcomitcont)+'º Commit no Banco, Cache commit '+IntToStr(vCommitt)+' Total ja gravado '+IntToStr(vcomitado));
              memoscript.Lines.Add('Iniciando '+IntToStr(vcomitcont)+'º Commit no Banco, Cache commit '+IntToStr(vCommitt)+' Total ja gravado '+IntToStr(vcomitado));
              if dm.QryInsertTable.UpdatesPending then
                dm.QryInsertTable.ApplyUpdates();

              dm.Commit;
              memoscript.Lines.Add('Commit realizado. Registros commitados '+IntToStr(vCommitt)+'.');
              vcomitado := vcomitado + vCommitt;
              vCommitt := 0;

            end;
            dm.QrySelect.Next;
            PgBarScript.Position := PgBarScript.Position + 1;
          finally
            FreeAndNil(clsp);
          end;
        end;
        if dm.QryInsertTable.UpdatesPending then
        begin
          inc(vcomitcont);
          if dm.QryInsertTable.UpdatesPending then
          begin
            dm.StartTransaction;
            memoscript.Lines.Add('-----------------------------------------');
            AdvMemo1.Lines.Add('Iniciando '+IntToStr(vcomitcont)+'º Commit no Banco, Cache commit '+IntToStr(vCommitt)+', total ja gravado '+IntToStr(vcomitado));
            memoscript.Lines.Add('Iniciando '+IntToStr(vcomitcont)+'º Commit no Banco, Cache commit '+IntToStr(vCommitt)+' Total ja gravado '+IntToStr(vcomitado));
            dm.QryInsertTable.ApplyUpdates();
            memoscript.Lines.Add('Commit realizado. Toral Commitado '+IntToStr(vCommitt)+' registros.');
            dm.Commit;
          end;
          vcomitado := vcomitado + vCommitt;
          vcomitcont := 0;
          vcomitado := 0;

        end;
        dm.QryExecuteparam.Edit;
        dm.QryExecuteparamMARCADO.AsInteger := 0;
        dm.QryExecuteparam.Post;
        dm.QryExecuteparam.Next;
        memoscript.Lines.Add('');
        memoscript.Lines.Add('-----------------------------------------------------------------------------');
      end;

    except
      on e: exception do
      begin
        memoscript.Lines.Add('-----------------------------------------');
        memoscript.Lines.Add('Ocorreu o seguinte erro :');
        memoscript.Lines.Add(e.Message);
        memoscript.Lines.Add('combinação :'+dm.QryParaminsCAMPO_ORIGEM.AsString+'  '+dm.QryParaminsCAMPO_DESTINO.AsString);
        memoscript.Lines.Add('A operação sera interrompida.');
        memoscript.Lines.Add('-----------------------------------------');
        dm.Roolback;
      end;
    end;
  finally
    sombra(sbFree,'');
    dm.QryExecuteparamORDEM_EXEC.ReadOnly := false;
  end;


end;

Function TGeradorScript.tratavalores(clsp: Tinfofield):Variant;
var
  valorfield: string;
  vValSeq: Integer;
  vQry :TUniQuery;
  sqlval: string;
  valorvar: string;
  F: Integer;

  Function tratacaracteres(vValor:string):variant;
  var
    S: Integer;
    Val            : variant;
  begin
    S := 0;
    if vValor = '' then
       Val := null
    else
      Val := vValor;
    try
      if Val <> null then
      begin
        if dm.QryParaminsRETIRAR_ACENTOS.AsBoolean then
          Val := DM.retiraracentos(VarToStrDef(Val,''));
        if dm.QryParaminsCONVETER_MAIUSCULO.AsBoolean then
          Val :=  UpperCase(VarToStrDef(Val,''));
        if (dm.QryParaminsFILTRAR_CARACTERES.AsInteger > 0) then
          Val := FilterChars(VarToStrDef(Val,''),vFiltros[dm.QryParaminsFILTRAR_CARACTERES.AsInteger]);
        if (dm.QryParaminsAJUSTAR_TAMANHO.Value) then
          Val :=  Copy(VarToStrDef(Val,''),1,clsp.SizeDst);
        if (dm.QryParaminsRTFTOTEXT.Value) then
          Val := RichTextToPlainText(Val);

          valorfield := Val;
        if ((length(trim(dm.QryParaminsCARACTERES_REMOVER.AsString)) > 0)) then
        begin
          for S := 0 to High(SplitString(trim(dm.QryParaminsCARACTERES_REMOVER.AsString),',')) do
            Val := ReplaceStr(Val,SplitString(trim(dm.QryParaminsCARACTERES_REMOVER.AsString),',')[S],'');
        end;

      end;
    finally
      Result :=  Val;
    end;
  end;
begin
  F := 0;

  valorvar := '';
  sqlval := '';

  vValSeq := -1;
  valorfield := '';
  try
    try
      valorfield := VarToStrDef(clsp.ValOrg,'');
      if dm.QryParaminsGERAR_VALOR.Value then
      begin
        case dm.QryParaminsTIPOVALOR_GERAR.Value of
           0: valorfield := DM.GetSql('SELECT SEQUENCIA FROM G_SP_SEQUENCIAS('+QuotedStr(dm.QryParaminsTABELA_DESTINO.AsString)+')');
           1: valorfield := DM.GetSql('SELECT SEQUENCIA - '+dm.QryParaminsVALOR_A_CONSIDERAR.AsString +' FROM G_SP_SEQUENCIAS('+QuotedStr(dm.QryParaminsTABELA_DESTINO.AsString)+')');
           2: valorfield := DM.GetSql('SELECT SEQUENCIA + '+dm.QryParaminsVALOR_A_CONSIDERAR.AsString +' FROM G_SP_SEQUENCIAS('+QuotedStr(dm.QryParaminsTABELA_DESTINO.AsString)+')');
           3: begin
                if Fsequencia < dm.QryParaminsVALOR_A_CONSIDERAR.Value then
                  Fsequencia := math.IfThen(dm.QryParaminsVALOR_A_CONSIDERAR.Value = 0,1,dm.QryParaminsVALOR_A_CONSIDERAR.Value)
                else
                   inc(Fsequencia);
                valorfield:= inttostr(Fsequencia);
              end;
           4: begin
                valorfield := DM.GetSql('SELECT SEQUENCIA FROM G_SP_SEQUENCIAS('+QuotedStr(dm.QryParaminsSEQUENCIA.AsString)+')');
              end;
        end;
        clsp.ValOrg:= valorfield;
        exit;
      end;
      if clsp.CampoDefault then
      begin
        valorfield:= HashcodeDefault(clsp);
        clsp.ValOrg := valorfield;
        exit;
      end;

      if clsp.Rotinasql <> '' then
      begin
        if pos('[D]',clsp.Rotinasql) > 0 then
          clsp.OrigemSub := 'D'
        else
          clsp.OrigemSub := 'O';
        if pos('SELECT',UPPERCASE(clsp.ValorFuSqlPers))>0 then
        BEGIN
          if pos(':',clsp.ValorFuSqlPers) > 0 then
          begin
           // clsp.Rotinasql_prm  := clsp.ValorFuSqlPers;

            clsp.Rotinasql      := substituivariaveis(clsp);
            sqlval := clsp.Rotinasql;
          end;

          //sqlval:=SubselectSqlRotina(valorfield,clsp);
          valorfield := '';
          AdvMemo1.Lines.Add('Valor Select/Valor Personal : '+sqlval);
          if clsp.OrigemSub = 'O' then
            vQry:= DM.GetSqlSelec(sqlval,cgOrigem)
          else
            vQry:= DM.GetSqlSelec(sqlval,cgDestino);
          vQry.Open;
          if not vQry.IsEmpty then
          begin
            for F := 0 to pred(vQry.FieldCount) do
            begin
              valorfield := VarToWideStrDef(tratacaracteres(vQry.Fields[F].AsString),'');
              if length(valorfield) > 0 then
                break;
            end;
          end;
          vQry.Close;
          if valorfield <> '' then
            clsp.ValOrg:=  valorfield
          else
            clsp.ValOrg:=  null;
        END ELSE
        if pos('SOMA',UPPERCASE(clsp.ValorFuSqlPers))>0  then
        BEGIN
           valorfield          := FloatToStr(SomaCamapos(clsp));
           clsp.ValOrg         := valorfield;
        END ELSE
        begin
          valorfield := clsp.Rotinasql_prm;
          clsp.ValOrg:= valorfield;
          AdvMemo1.Lines.Add('Valor Select/Valor Personal : '+clsp.ValOrg);
        end;
        if pos(':',valorfield) > 0 then
        begin
          clsp.Rotinasql_prm  := valorfield;
          valorfield          := substituivariaveis(clsp);
          clsp.ValOrg         := valorfield;
        end;
        exit;
      end;

      valorfield := verificaSubstituicaoAuto(clsp);
      if valorfield <> '' then
        clsp.ValOrg:= valorfield;

    except
      raise;
    end;
  finally
     clsp.ValOrg := tratacaracteres(VarToStrDef(clsp.ValOrg,''));
     if VarToStrDef(clsp.ValOrg,'') = '' then
      if clsp.ValorDefaultCampo <> '' then
        clsp.ValOrg:= clsp.ValorDefaultCampo
      else
        clsp.ValOrg:=  null;
     AdvMemo1.Lines.Add('Valor a ser gravado....: '+VarToStrDef(clsp.ValOrg,''));
  end;
end;

FUNCTION TGeradorScript.SomaCamapos(clspS: Tinfofield):double;
var
  swlm :string;
  I: Integer;
begin
  I := 0;
  Result := 0;
  for I := Low(SplitString(clspS.CamposSomar,',')) to High(SplitString(clspS.CamposSomar,',')) do
  begin
    swlm := trim(ReplaceStr(SplitString(clspS.CamposSomar,',')[I],':',''));
    swlm :=trim(ReplaceStr(swlm,')',''));
    if clspS.OrigemSub = 'O' then
      Result := Result + StrToFloatDef(dm.QrySelect.FieldByName(swlm).AsString,0)
    else
      Result :=0.00;
  end;



end;

function TGeradorScript.verificaSubstituicaoAuto(clsp: Tinfofield):String;
var
  valorvar: string;
begin
  valorvar := '';
  Result := '';
  if not dm.QrySubstQueriesins.IsEmpty then
  begin
    dm.QrySubstQueriesins.first;
   // dm.QrySubstQueriesins.Filter := '
    if dm.QrySubstQueriesins.Locate('ID_CONVERSAO;TABELA_DESTINO;CAMPO;VALOR_ORIGEM',VarArrayOf([clsp.IdCombinacao,clsp.TabelaDestino,clsp.CampoDestino, VarToStr(clsp.ValOrg)]),[]) then
    begin
      if pos('*',dm.QrySubstQueriesinsVALOR_DESTINO.AsString) > 0 then
      begin
        valorvar    := copy(dm.QrySubstQueriesinsVALOR_DESTINO.AsString,pos('*',dm.QrySubstQueriesinsVALOR_DESTINO.AsString)+1,length(dm.QrySubstQueriesinsVALOR_DESTINO.AsString));
        Result  := dm.QrySelect.FieldByName(valorvar).AsString;
      end else
      begin
        Result  := dm.QrySubstQueriesinsVALOR_DESTINO.AsString;
      end;
    end;
  end;
end;


procedure TGeradorScript.Gravadadosimportado(clsp: Tinfofield);
begin
  inserememo;
  try
    if not (clsp.TipoDst = ftBlob) then
      tratavalores(clsp);
    if clsp.ValOrg = null then exit;

     case clsp.TipoDst of
      ftSmallint, ftInteger, ftWord, ftLargeint, ftLongWord, ftShortint, ftByte :
      begin
        dm.QryInsertTable.FieldByName(dm.QryParaminsCAMPO_DESTINO.AsString).AsInteger := StrToInt(FilterChars(vartostr(clsp.ValOrg),['0'..'9']));
      end;
      ftString, ftMemo, ftWideMemo, ftVarBytes:
      begin
        dm.QryInsertTable.FieldByName(dm.QryParaminsCAMPO_DESTINO.AsString).AsString := VarToWideStrDef(clsp.ValOrg,'');
      end;
      ftFloat, ftCurrency, ftBCD:
      begin
        if pos('E',VarToWideStrDef(clsp.ValOrg,'')) > 0 then
          clsp.ValOrg := copy(VarToWideStrDef(clsp.ValOrg,''),1,pos('E',VarToWideStrDef(clsp.ValOrg,''))-1);
        dm.QryInsertTable.FieldByName(dm.QryParaminsCAMPO_DESTINO.AsString).AsFloat :=  VarAsType(clsp.ValOrg, varDouble);
      end;
      ftDate, ftTime, ftDateTime, ftTimeStamp:
      begin
        if validadatahora(VarToWideStrDef(clsp.ValOrg,''),clsp) then
          dm.QryInsertTable.FieldByName(dm.QryParaminsCAMPO_DESTINO.AsString).AsDateTime := VarToDateTime(clsp.ValOrg);
      end;
      ftBlob:
      begin
        dm.QryInsertTable.FieldByName(dm.QryParaminsCAMPO_DESTINO.AsString).Value := clsp.ValOrg;
      end;
      ftBoolean:
      begin
        dm.QryInsertTable.FieldByName(dm.QryParaminsCAMPO_DESTINO.AsString).AsBoolean := VarAsType(clsp.ValOrg,varBoolean);
      end;
    end;
  except
    raise;
  end;
end;


function TGeradorScript.HashcodeDefaultComparacoes:string;
var
  idxhash,
  vlnb :string;
  i : integer;
  listaudk :Tstringlist;
begin
  idxhash := '';
  //listaudk := TStringList.Create;
  //listaudk.Clear;
  try
   // listaudk.Text:= FLstudk;
    for I := 0 to pred(dm.QrySelect.Fields.Count) do
    begin
      // dm.QryParamWhr.Locate('CAMPO_ORIGEM',dm.QrySelect.Fields[I].FieldName,[]);
     // if not dm.QryParamWhrCOMPORCHAVEDEFAULT.AsBoolean then continue;
      if ((dm.QrySelect.Fields[I].AsString = '') {or (not(StrToBoolDef(listaudk.Values[dm.QrySelect.Fields[I].FieldName],true)))})  then continue;
      if ((I mod 10) = 0) then
        vlnb := #13;
      idxhash := ifthen(idxhash='',dm.QrySelect.Fields[I].AsString,idxhash+vlnb+dm.QrySelect.Fields[I].AsString);
      vlnb := '';
    end;
    Result :=   THashSHA2.GetHashString(idxhash,THashSHA2.TSHA2Version.SHA256).ToUpper;
  finally
    //FreeAndNil(listaudk);
  end;
end;

function TGeradorScript.HashcodeDefault(clsp: Tinfofield):string;
var
  idxhash,
  vlnb :string;
  i : integer;
  listaudk :Tstringlist;
begin
  idxhash := '';
    listaudk := TStringList.Create;
  listaudk.Clear;
  try
    listaudk.Text:= FLstudk;
    for I := 0 to pred(dm.QrySelect.Fields.Count) do
    begin
      if ((dm.QrySelect.Fields[I].AsString = '') or (not(StrToBoolDef(listaudk.Values[dm.QrySelect.Fields[I].FieldName],true))))  then continue;
      if ((I mod 10) = 0) then
        vlnb := #13;
      idxhash := ifthen(idxhash='',dm.QrySelect.Fields[I].AsString,idxhash+vlnb+dm.QrySelect.Fields[I].AsString);
      vlnb := '';
    end;
    Result :=   THashSHA2.GetHashString(idxhash,THashSHA2.TSHA2Version.SHA256).ToUpper;
  finally
     FreeAndNil(listaudk);
  end;
end;


 function TGeradorScript.TrataParametrosgeral(campodestino, Sql:string):String;
var
   I: Integer;
   parametro,
   valorparam,
   vSql :string;
   classe : Tinfofield;
  vfieldtipoDst: TFieldType;
  vfieldtipoOrg: TFieldType;
begin
  I := 0;
  Result := Sql;
  dm.QryMontaPrSelect.close;
  dm.QryMontaPrSelect.sql.clear;
  dm.QryMontaPrSelect.sql.Text := Sql;
  if dm.QryMontaPrSelect.Params.Count > 0 then
  begin
    try
      classe := Tinfofield.Create;
      for I := 0 to pred(dm.QryMontaPrSelect.Params.Count) do
      begin
        dm.QryParamWhr.First;
        dm.QryParamWhr.Locate('CAMPO_DESTINO',campodestino,[]);
        valorparam        := SplitString(dm.QryMontaPrSelect.Params[I].Name,'#')[0];
        Application.ProcessMessages;
        vfieldtipoDst     := Retornatipofield(dm.QryParamWhrTIPODADO_DESTINO.AsString);
        vfieldtipoOrg     := Retornatipofield(dm.QryParamWhrTIPODADO_ORIGEM.AsString);
        classe.TipoOrg    := vfieldtipoOrg;
        classe.FTipoDst   := vfieldtipoDst;
        classe.FSizeDst   := dm.QryParamWhrTAM_CAMPO_DESTINO.Value;
        classe.FSizeOrg   := dm.QryParamWhrTAM_CAMPO_DESTINO.Value;
        classe.ValOrg     := dm.QrySelect.FieldByName(valorparam).Value;
        classe.Filtro     := StrToIntDef(SplitString(dm.QryMontaPrSelect.Params[I].Name,'#')[3],0);
        classe.Maiusculo  := SplitString(dm.QryMontaPrSelect.Params[I].Name,'#')[1] = 'S';
        classe.RAcentos   := SplitString(dm.QryMontaPrSelect.Params[I].Name,'#')[2] = 'S';
        Result := FormataValoropc(classe.ValOrg,classe);
      end;
    finally
      Freeandnil(classe);

    end;
  end;
end;


Function TGeradorScript.RetornaPersonalWerenovo(vcls:Tinfofield=nil):string;
var
  vlstcondicoes,
  vfield : string;
  F: Integer;
  vCondic: string;
  vWhr: string;
  linha: string;
begin
  linha := '';
  vWhr := '';
  vCondic := '';
  F := 0;
  vlstcondicoes := '';
   if not dm.QryPERSONALWHERES.IsEmpty then
    begin
     // dm.QryPERSONALWHERES.First;
       if dm.QryPERSONALWHERESCOMPARACOES.AsString <> '' then
       begin
         vlstcondicoes:= '';
         vlstcondicoes:= RetiraEnter(dm.QryPERSONALWHERESCOMPARACOES.AsString);
         for F := 0 to High(SplitString(vlstcondicoes,';')) do
         begin
           linha := vlstcondicoes[F];
           vCondic := trim(SplitString(vlstcondicoes,';')[F]);
           vfield  := trim(copy(UPPERCASE(trim(vCondic)),pos(' ',UPPERCASE(trim(vCondic))),pos('=',UPPERCASE(trim(vCondic)))-4));
           dm.QryParamWhr.First;
          // dm.QryParamWhr.Locate('CAMPO_DESTINO',campodestino,[]);
           //copy(UPPERCASE(trim(vCondic)),pos(' ',UPPERCASE(trim(vCondic))),pos('=',UPPERCASE(trim(vCondic)))-4);
           vWhr    := vWhr +TrataParametrosgeral(vfield,vCondic);
         end;
       end;
    end;
end;

Function TGeradorScript.RetornaPersonalWere(vcls:Tinfofield=nil):string;
var
  vwheres: string;
  vWhr: string;
  vsqlwhere: string;
  vfieldtipowh: TFieldType;
  clsp :Tinfofield;
  vlrwhere: string;
  vlstcondicoes: string;
  vCondic: string;
  F: Integer;
  vCondicSubn: string;
  vCondicSub: string;
  vsqlwheren: string;
  vCondicSubval: string;




begin
  vCondicSubval   := '';
  vsqlwheren      := '';
  vCondicSub      := '';
  vCondicSubn     := '';
  F               := 0;
  vCondic         := '';
  vlstcondicoes   := '';
  vlrwhere        := '';
  vsqlwhere       := '';
  vWhr            := '';
  vwheres         := '';
  Result          := '';
  try
    if not dm.QryPERSONALWHERES.IsEmpty then
    begin

      dm.QryPERSONALWHERES.First;
     // vwheres := ' Where 1 = 1 ';

      vWhr := '';
      while not dm.QryPERSONALWHERES.Eof do
      begin
        dm.QryParamWhr.First;
        dm.QryParamWhr.Locate('CAMPO_DESTINO',dm.QryPERSONALWHERESCAMPO_WHERE.AsString,[]);
        clsp := Tinfofield.Create;
        try
          vsqlwhere    := uppercase(RetiraEnter(dm.QryPERSONALWHERESROTINA_SQL.AsString));
          vsqlwhere    := copy(vsqlwhere,pos('SELECT',vsqlwhere),LENGTH(vsqlwhere));   //ReplaceStr(ReplaceStr(ReplaceStr(trim(vsqlwhere),'exists (',''),'not exists (','');
          vfieldtipowh := Retornatipofield(dm.QryParamWhrTIPODADO_DESTINO.AsString);
          clsp.TipoDst := vfieldtipowh;
          clsp.SizeOrg := 0;
          clsp.SizeDst := 0;
          vlrwhere     := FormataSqlTipoCampo(dm.QrySelect.FieldByName(dm.QryPERSONALWHERESCAMPO_WHERE.Value).AsString,vfieldtipowh,clsp);
          vwheres      := ReplaceStr(vsqlwhere,'@VALOR_ORIGEM@',vlrwhere);
          if dm.QryPERSONALWHERESCOMPARACOES.AsString <> '' then
          begin
            vlstcondicoes:= '';
            vlstcondicoes:= RetiraEnter(dm.QryPERSONALWHERESCOMPARACOES.AsString);

            for F := 0 to High(SplitString(vlstcondicoes,';')) do
            begin

              vCondic      := trim(SplitString(vlstcondicoes,';')[F]);
              if pos('#',vCondic) > 0 then
              begin
                clsp.Maiusculo  := SplitString(vCondic,'#')[1]='S';
                clsp.RAcentos   := SplitString(vCondic,'#')[2] = 'S';
                clsp.Filtro     := StrToIntDef(SplitString(vCondic,'#')[3],0);
                vCondic         := SplitString(vCondic,'#')[0];
              end;
              if pos('*',vCondic) > 0 then
              begin
                vCondicSubn  := dm.RetornaTextoEntreChar(SplitString(vCondic,' ')[3],['(',')']);
                vCondicSub   := SplitString(vCondic,'*')[1];
                vsqlwheren   := dm.RetornaTextoEntreChar(SplitString(vCondic,' ')[1],['(',')']);
                vsqlwhere    := SplitString(vCondic,' ')[1];
              end else
              begin
                vCondicSubn  := SplitString(vCondic,' ')[3];
                vCondicSub   := SplitString(vCondic,' ')[3];
                vsqlwheren   := SplitString(vCondic,' ')[1];
                vsqlwhere    := SplitString(vCondic,' ')[1];
              end;

              dm.QryParamWhr.Locate('CAMPO_DESTINO',vsqlwheren,[]);
              vfieldtipowh := Retornatipofield(dm.QryParamWhrTIPODADO_DESTINO.AsString);
              clsp.TipoDst := vfieldtipowh;
              clsp.SizeOrg := 0;
              clsp.SizeDst := 0;
              vCondicSub := ReplaceStr(vCondicSub,':','');
              vCondicSubval := FormataSqlTipoCampo(dm.QrySelect.FieldByName(vCondicSub).AsString,vfieldtipowh,clsp);

              vWhr := vWhr +' '+SplitString(vCondic,' ')[0]+' '+ vsqlwhere+' '+SplitString(vCondic,' ')[2]+' '+RetornaValorWhere(SplitString(vCondic,' ')[3],vCondicSubn,vCondicSubval,clsp);
            end;
          end;
           dm.QryPERSONALWHERES.next;
        finally
           FreeAndNil(clsp);
        end;
      end;
      vwheres := vwheres +' '+  vWhr;
    end;
  finally
    Result :=  vwheres;
  end;
end;

procedure TGeradorScript.postastatus(s:string ;reseta:boolean = false);
begin
  if reseta then
   memoscript.Clear;
  memoscript.Lines.Add(s);
  Application.ProcessMessages;
end;


procedure TGeradorScript.btndescartaClick(Sender: TObject);
begin
  if dm.MsgPerguntaSimNao('Ao clicar em sim todos os registros de combinação pra estaas tabelas ['+TcxGridDBTableView(Sender).DataController.DataSource.DataSet.FieldByName('TABELA_ORIGEM').AsString+' & '+TcxGridDBTableView(Sender).DataController.DataSource.DataSet.FieldByName('TABELA_DESTINO').AsString+'] serao apagados. confirma?') then
  begin
    DeletaAssociacaoGeral(TcxGridDBTableView(Sender).DataController.DataSource.DataSet.FieldByName('TABELA_ORIGEM').AsString,TcxGridDBTableView(Sender).DataController.DataSource.DataSet.FieldByName('TABELA_DESTINO').AsString);
    abrirFilhos;
  end;
end;

function TGeradorScript.RichTextToPlainText(richText: string): string;
var
  RichEdit1: TRichEdit;
  ss:tstringstream;
begin
  if Copy(richText, 1, 5) <> '{\rtf' then
  begin
    result := richText;
    exit;
  end;
  RichEdit1 := TRichEdit.Create(Application.MainForm);
  ss:= TStringstream.Create( trim(richText) );
  try
    // It doesn't work if Visible=true or Parent=nil ...
    RichEdit1.Width     := 0;
    RichEdit1.Height    := 10;
    RichEdit1.Parent    := Application.MainForm;
    RichEdit1.PlainText := FALSE;
    RichEdit1.Lines.LoadFromStream( ss );
    //RichEdit1.Lines.Text := trim(richText);
    RichEdit1.Update;
    RichEdit1.PlainText := true;

    result := Trim(RichEdit1.text);
  finally
    FreeAndNil(RichEdit1);
    ss.free;
  end;
end;

procedure TGeradorScript.btnEcecutarClick(Sender: TObject);
begin
  memoscript.Lines.Clear;
  if dm.QryExecuteparam.State in [dsInsert,dsEdit] then
    dm.QryExecuteparam.post;
  if dm.QryExecuteparam.UpdatesPending then
    dm.QryExecuteparam.ApplyUpdates();
  AdvMemo1.Lines.Clear;
  memoscript.Lines.Clear;
 //dm.Executasql('Update CONVERSAO SET ORDEM_EXEC = '+VarToStrDef(TcxSpinEdit(Sender).Value,'0')+' where TABELA_ORIGEM = '+QuotedStr(dm.QryOrdenaTABELA_ORIGEM.AsString)+' and TABELA_DESTINO ='+QuotedStr(dm.QryOrdenaTABELA_DESTINO.AsString),cgParametro);
  postastatus('Iniciando processo...');
  {
  case rdgtipoexec.ItemIndex of
     0:ExecucaoManual;
     1:executeScriptTable;
  end;
  }
  executeScriptTable;
end;

procedure TGeradorScript.EdiotordeConsultasSql1Click(Sender: TObject);
begin
  TfrmEditorSql.AbreEditor;
end;

procedure TGeradorScript.EditarCombinao1Click(Sender: TObject);
begin
  //edita combinação

  cxPageControl1.ActivePage:= TbShmodelar;
  cbSistema.ItemIndex := cbSistema.Properties.Items.IndexOf(dm.QryExecuteparamSISTEMA.AsString);
  cbSistemaPropertiesCloseUp(cbSistema);
  DBLKCBOrigem.EditValue := dm.QryExecuteparamTABELA_ORIGEM.AsString;
  DBLKCBOrigemPropertiesCloseUp(DBLKCBOrigem);
  DBLKCBDestino.EditValue := dm.QryExecuteparamTABELA_DESTINO.AsString;
  DBLKCBDestinoPropertiesCloseUp(DBLkCBCampoDestino);
end;

procedure TGeradorScript.ExecucaoManual;
var
  I: Integer;
  vsinsert,
  valorfield,
  vFields,
  vsvalues :string;
  vfieldtipoDst : TFieldType;
  vfieldtipoOrg : TFieldType;
  valorbrutofield: string;
  vwheres :string;
  comitar: Integer;
  vLinha: string;
  dIRoPERACAO: STRING;
  S: Integer;
  vsqlwhere: string;
  vlrwhere: string;
  vfieldtipowh: TFieldType;
  clsp: Tinfofield;
  vInicio: string;
  vqtdlinhas: Integer;
  vTI: Integer;
  vValSeq: Integer;
  vlstcondicoes: String;
  vWhr: string;
  vCondic: string;
  vCondicSub: string;
  vCondicSubval: string;
  F: Integer;
  upl: Integer;
  vConteudo: string;
  vsqlwheren: string;
  vCondicSubn: string;
  vUpper: string;
  vRetAcen: string;
  vFiltro: string;
begin
  vFiltro := '';
  vRetAcen := '';
  vUpper := '';
  vCondicSubn := '';
  vsqlwheren := '';
  vConteudo := '';
  upl := 0;
  F := 0;
  vCondicSubval := '';
  vCondicSub := '';
  vCondic := '';
  vWhr := '';
  vValSeq := 0;
  vTI := 0;
  vqtdlinhas :=0;
  if (FTodas) then
  begin
    dm.CcnParametros.ExecSQL(' DELETE FROM TABELASCRIPTS where  TIPO_SCRIPT <> '+QUOTEDSTR('P'));
  end
  else begin
    dm.CcnParametros.ExecSQL(' DELETE FROM TABELASCRIPTS WHERE  TABELA_DESTINO = '+quotedstr(dm.QryExecuteparamTABELA_DESTINO.AsString)+'  AND TABELA_ORIGEM = '+quotedstr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
  end;
  dm.Qry_ScriptArq.ExecSQL;
  try
    PgbarReg.tag := 1;
    PgBarScript.Tag := 1;
    memoscript.Tag := 1;
    sombra(sbCrt,'Aguarde. ...');

    vInicio := '';
    vlrwhere := '';
    vsqlwhere := '';
    S := 0;
    vLinha := '';
    comitar := 0;
    valorbrutofield := '';
    I := 0;
    dm.QryExecuteparam.close;
    dm.QryExecuteparam.Open;
   // exit;
    AdvMemo1.Lines.Clear;
    memoscript.Lines.Clear;
    dIRoPERACAO := FTempdir+'TemArquivos\';
    if not DirectoryExists(dIRoPERACAO) then
      ForceDirectories(dIRoPERACAO);
    AdvMemo1.Lines.Clear;
    sombra(sbUp,'Executando Filtros');
     try
        sombra(sbUp,'Gerando Script dos dados.');
        dm.QryExecuteparam.First;
        while not dm.QryExecuteparam.eof do
        begin
          dm.QryScript.Close;
          dm.QryScript.RestoreSQL;
          dm.QryScript.DeleteWhere;
          dm.QryScript.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryExecuteparamTABELA_DESTINO.AsString));
          dm.QryScript.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
          dm.QryScript.Open;

          memoscript.Lines.Add('Criando Script aguarde ...');
          memoscript.Lines.Add('Origem dos Dados :'+ dm.QryExecuteparamTABELA_ORIGEM.AsString );
          memoscript.Lines.Add('Destino dos Dados :'+ dm.QryExecuteparamTABELA_DESTINO.AsString );


          IniciaArquivo(dIRoPERACAO+dm.QryExecuteparamTABELA_DESTINO.AsString+'.SQL');
          vwheres := '';
          Application.ProcessMessages;
          dm.QryPersQueryExec.close;
          dm.QryPersQueryExec.RestoreSQL;
          dm.QryPersQueryExec.AddWhere(' QRY_NOME = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
          dm.QryPersQueryExec.Open;

          dm.QryPersonalFields.Close;
          dm.QryPersonalFields.RestoreSQL;
          dm.QryPersonalFields.DeleteWhere;
          dm.QryPersonalFields.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryExecuteparamTABELA_DESTINO.AsString));
          dm.QryPersonalFields.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
          dm.QryPersonalFields.Open;
         // vlinha := Sincronizasequencia(dm.QryExecuteparamTABELA_DESTINO.AsString,'');
          dm.QryPersonalFields.First;
          if not dm.QryPersonalFields.IsEmpty then
          begin
             sombra(sbUp,'Criando rotina de campos personalizados.');
            vInicio := ' execute block  '+#13+
                       '         as  '+#13+
                       '         begin '+#13;
            WriteLn(FsArquivo,vInicio);
            dm.QryPersonalFields.First;
            while not dm.QryPersonalFields.Eof do
            begin
              vLinha := dm.QryPersonalFieldsROTINA_SQL.AsString+';';
              AdvMemo1.Lines.Add(vLinha);
              WriteLn(FsArquivo, vlinha);
              dm.QryPersonalFields.next;
              Application.ProcessMessages;
            end;
            WriteLn(FsArquivo,'END;');
            WriteLn(FsArquivo, 'COMMIT WORK;');
          end;

           sombra(sbUp,'Verificando se tem condição pra inserir.');
          dm.QryPERSONALWHERES.Close;
          dm.QryPERSONALWHERES.RestoreSQL;
          dm.QryPERSONALWHERES.DeleteWhere;
          dm.QryPERSONALWHERES.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryExecuteparamTABELA_DESTINO.AsString));
          dm.QryPERSONALWHERES.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
          dm.QryPERSONALWHERES.Open;



          dm.QrySelect.Close;
          dm.QrySelect.SQL.Clear;
          if not dm.QryPersQueryExec.IsEmpty then
            dm.QrySelect.SQL.Text := dm.QryPersQueryExecQRY_TEXT.AsString
          else
            dm.QrySelect.SQL.Text := 'Select * from '+dm.QryExecuteparamTABELA_ORIGEM.AsString;
          dm.QrySelect.Open;
          dm.QrySelect.First;

          dm.QryParamins.close;
          dm.QryParamins.RestoreSQL;
          dm.QryParamins.DeleteWhere;
          dm.QryParamins.AddWhere('SISTEMA = '+quotedstr(dm.QryExecuteparamSISTEMA.Value));
          dm.QryParamins.AddWhere('TABELA_DESTINO = '+quotedstr(dm.QryExecuteparamTABELA_DESTINO.Value));
          dm.QryParamins.AddWhere('TABELA_ORIGEM = '+QuotedStr(dm.QryExecuteparamTABELA_ORIGEM.AsString));
          dm.QryParamins.SetOrderBy('SISTEMA,TABELA_DESTINO,IDX_CAMPO_DESTINO');
          dm.QryParamins.Open;

          vsinsert := 'INSERT INTO '+dm.QryExecuteparamTABELA_DESTINO.Value+'(';
          vFields:='';
           sombra(sbUp,'Gerando mapa de fields.');
          dm.QryParamins.First;
          while not dm.QryParamins.Eof do
          begin
            Application.ProcessMessages;
            vFields:=ifthen(vFields='',dm.QryParaminsCAMPO_DESTINO.asstring,vFields+','+dm.QryParaminsCAMPO_DESTINO.asstring);
            dm.QryParamins.Next;
            Application.ProcessMessages;
          end;
          vsinsert:= vsinsert+vFields+')';
          PgBarScript.Properties.Min := 0;
          PgBarScript.Properties.Max := dm.QrySelect.RecordCount;
          sombra(sbUp,'Grando Script :'+dm.QryExecuteparamTABELA_ORIGEM.AsString+' / '+dm.QryExecuteparamTABELA_DESTINO.AsString+'. Aguarde. ...');
          PgBarScript.Position := 0;
          while not dm.QrySelect.Eof do
          begin
            Application.ProcessMessages;
            vsvalues := '';
            PgbarReg.Properties.Min := 0;
            PgbarReg.Properties.Max := dm.QryParamins.RecordCount;
            PgbarReg.Position := 0;
            dm.QryParamins.First;
            while not dm.QryParamins.Eof do
            begin
              clsp := Tinfofield.Create;
              try
                Application.ProcessMessages;
                //vcampos         :=
                vfieldtipoDst   := Retornatipofield(dm.QryParaminsTIPODADO_DESTINO.AsString);
                vfieldtipoOrg   := Retornatipofield(dm.QryParaminsTIPODADO_ORIGEM.AsString);
                valorfield      := '';
                valorbrutofield := '';
                clsp.TipoOrg  := vfieldtipoOrg;
                clsp.FTipoDst := vfieldtipoDst;
                clsp.FSizeDst := dm.QryParaminsTAM_CAMPO_DESTINO.Value;
                clsp.FSizeOrg := dm.QryParaminsTAM_CAMPO_ORIGEM.Value;
                clsp.ValOrg   :=  dm.QrySelect.FieldByName(dm.QryParaminsCAMPO_ORIGEM.Value).AsString;
                if dm.QryParaminsRETIRAR_ACENTOS.AsBoolean then
                  clsp.ValOrg := DM.retiraracentos(clsp.ValOrg);
                if dm.QryParaminsCONVETER_MAIUSCULO.AsBoolean then
                  clsp.ValOrg :=  UpperCase(clsp.ValOrg);
                if (dm.QryParaminsFILTRAR_CARACTERES.AsInteger > 0) then
                   clsp.ValOrg := FilterChars(clsp.ValOrg,vFiltros[dm.QryParaminsFILTRAR_CARACTERES.AsInteger]);
                if pos(' [',dm.QryParaminsPERSONAL_SELECT.AsString) > 0 then
                  clsp.Rotinasql := trim(copy(dm.QryParaminsPERSONAL_SELECT.AsString,1,pos(' [',dm.QryParaminsPERSONAL_SELECT.AsString)))
                else
                  clsp.Rotinasql := trim(dm.QryParaminsPERSONAL_SELECT.AsString);
                clsp.CampoOrigem := dm.QryParaminsCAMPO_ORIGEM.AsString;
                clsp.CampoDestino := dm.QryParaminsCAMPO_DESTINO.AsString;
                if dm.QryParaminsGERAR_VALOR.Value then
                begin


                  case dm.QryParaminsTIPOVALOR_GERAR.Value of
                     0: valorfield := '(SELECT SEQUENCIA FROM G_SP_SEQUENCIAS('+QuotedStr(dm.QryParaminsTABELA_DESTINO.AsString)+'))';
                     1: valorfield := '(SELECT SEQUENCIA - '+dm.QryParaminsVALOR_A_CONSIDERAR.AsString +' FROM G_SP_SEQUENCIAS('+QuotedStr(dm.QryParaminsTABELA_DESTINO.AsString)+'))';
                     2: valorfield := '(SELECT SEQUENCIA + '+dm.QryParaminsVALOR_A_CONSIDERAR.AsString +' FROM G_SP_SEQUENCIAS('+QuotedStr(dm.QryParaminsTABELA_DESTINO.AsString)+'))';
                     3: begin
                          if vValSeq < dm.QryParaminsVALOR_A_CONSIDERAR.Value then
                            vValSeq := dm.QryParaminsVALOR_A_CONSIDERAR.Value
                          else
                             inc(vValSeq);
                          valorfield:= inttostr(vValSeq);
                        end;
                  end;
                end else
                begin
                  dm.QrySubstQueriesins.close;
                  dm.QrySubstQueriesins.RestoreSQL;
                  dm.QrySubstQueriesins.DeleteWhere;
                  dm.QrySubstQueriesins.AddWhere('ID_CONVERSAO ='+dm.QryParaminsID.AsString);
                  dm.QrySubstQueriesins.Open;
                  valorbrutofield := verificaSubstituicao(clsp);
                  if length(trim(dm.QryParaminsCARACTERES_REMOVER.AsString)) > 0 then
                    for S := 0 to High(SplitString(trim(dm.QryParaminsCARACTERES_REMOVER.AsString),',')) do
                       valorbrutofield := ReplaceStr(valorbrutofield,SplitString(trim(dm.QryParaminsCARACTERES_REMOVER.AsString),',')[S],'');

                  if dm.QryParaminsPERSONAL_SELECT.AsString = '' then
                    valorfield:=FormataSqlTipoCampo(valorbrutofield,clsp.FTipoDst,clsp)
                  else
                    valorfield:= '('+SubselectSqlRotina(valorbrutofield,clsp)+')';
                end;
                vsvalues:=ifthen(vsvalues = '',valorfield,vsvalues+','+valorfield);

              finally
                FreeAndNil(clsp);
                dm.QryParamins.Next;
                PgbarReg.Position := PgbarReg.Position + 1;
              end;
            end;

            if not dm.QryPERSONALWHERES.IsEmpty then
            begin
              dm.QryPERSONALWHERES.First;
              vwheres := ' Where 1 = 1 ';
              vWhr := '';
              while not dm.QryPERSONALWHERES.Eof do
              begin
                clsp := Tinfofield.Create;
                try
                  vsqlwhere    := RetiraEnter(dm.QryPERSONALWHERESROTINA_SQL.AsString);
                  vfieldtipowh := Retornatipofield(dm.QryParaminsTIPODADO_DESTINO.AsString);
                  clsp.TipoDst := vfieldtipowh;
                  clsp.SizeOrg := 0;
                  clsp.SizeDst := 0;
                  vlrwhere     := FormataSqlTipoCampo(dm.QrySelect.FieldByName(dm.QryPERSONALWHERESCAMPO_WHERE.Value).AsString,vfieldtipowh,clsp);
                  vwheres      := vwheres + ' And  '+ ReplaceStr(vsqlwhere,'@VALOR_ORIGEM@',vlrwhere);
                  if dm.QryPERSONALWHERESCOMPARACOES.AsString <> '' then
                  begin
                    vlstcondicoes:= '';
                    vlstcondicoes:= RetiraEnter(dm.QryPERSONALWHERESCOMPARACOES.AsString);

                    for F := 0 to High(SplitString(vlstcondicoes,';')) do
                    begin

                      vCondic      := trim(SplitString(vlstcondicoes,';')[F]);
                      if pos('#',vCondic) > 0 then
                      begin
                        clsp.Maiusculo  := SplitString(vCondic,'#')[1]='S';
                        clsp.RAcentos   := SplitString(vCondic,'#')[2] = 'S';
                        clsp.Filtro     := StrToIntDef(SplitString(vCondic,'#')[3],0);
                        vCondic         := SplitString(vCondic,'#')[0];
                      end;
                      if pos('*',vCondic) > 0 then
                      begin
                        vCondicSubn  := dm.RetornaTextoEntreChar(SplitString(vCondic,' ')[3],['(',')']);
                        vCondicSub   := SplitString(vCondic,'*')[1];
                        vsqlwheren   := dm.RetornaTextoEntreChar(SplitString(vCondic,' ')[1],['(',')']);
                        vsqlwhere    := SplitString(vCondic,' ')[1];
                      end else
                      begin
                        vCondicSubn  := SplitString(vCondic,' ')[3];
                        vCondicSub   := SplitString(vCondic,' ')[3];
                        vsqlwheren   := SplitString(vCondic,' ')[1];
                        vsqlwhere    := SplitString(vCondic,' ')[1];
                      end;

                      dm.QryParamins.Locate('CAMPO_DESTINO',vsqlwheren,[]);
                      vfieldtipowh := Retornatipofield(dm.QryParaminsTIPODADO_DESTINO.AsString);
                      clsp.TipoDst := vfieldtipowh;
                      clsp.SizeOrg := 0;
                      clsp.SizeDst := 0;
                      vCondicSubval := FormataSqlTipoCampo(dm.QrySelect.FieldByName(vCondicSub).AsString,vfieldtipowh,clsp);

                      vWhr := vWhr +' '+SplitString(vCondic,' ')[0]+' '+ vsqlwhere+' '+SplitString(vCondic,' ')[2]+' '+RetornaValorWhere(SplitString(vCondic,' ')[3],vCondicSubn,vCondicSubval,clsp);
                    end;
                  end;
                   dm.QryPERSONALWHERES.next;
                finally
                   FreeAndNil(clsp);
                end;
              end;
              vwheres := vwheres +' '+  vWhr;
            end;

            vLinha := '';
            if length(vwheres) > 0  then
                vLinha := (vsinsert+' SELECT '+vsvalues+' FROM RDB$DATABASE '+vwheres+');')
            ELSE
                vLinha := (vsinsert+' VALUES ('+vsvalues+');');
            AdvMemo1.Lines.Add(vLinha);
            WriteLn(FsArquivo, vlinha);
            if (comitar = cxSpEdtcomit.Value) then
            begin
              comitar := 0;
              vLinha :=('COMMIT WORK;');
              WriteLn(FsArquivo, vlinha);
              AdvMemo1.Lines.Add(vLinha);
              AdvMemo1.Lines.Clear;
            end;
            inc(comitar);
            dm.QrySelect.Next;

            if (vqtdlinhas = 20000) then
            begin
              vLinha :=('COMMIT WORK;');
              WriteLn(FsArquivo, vlinha);
              CloseFile(FsArquivo);
              gravaProjeto(dm.QryParaminsTABELA_DESTINO.AsString+'_'+inttostr(vTI)+'.Sql','S');
              inc(vTI);
              vqtdlinhas:=0;
              comitar := 0;
              IniciaArquivo(dIRoPERACAO+dm.QryExecuteparamTABELA_DESTINO.AsString+inttostr(vTI)+'.SQL');
            end;
            if ChkLimitar.Checked then
              inc(vqtdlinhas);
            inc(I);
            PgBarScript.Position := PgBarScript.Position +1;
          end;
          vLinha :=('COMMIT WORK;');
          WriteLn(FsArquivo, vlinha);
          CloseFile(FsArquivo);
          inc(vTI);
          gravaProjeto(dm.QryParaminsTABELA_DESTINO.AsString+'_'+inttostr(vTI)+'.Sql','S');
          //GeraUpdateObsGEral;
          dm.QryExecuteparam.Next;
          vqtdlinhas:=0;
        end;
     except on e: exception do
       begin
 //        if FsArquivo <> nil then
           CloseFile(FsArquivo);
         ShowMessage('Erro Gerando Escript '+#13+ e.Message);
       end;
     end;

  finally
     sombra(sbFree);
     PgbarReg.tag := 0;
     PgBarScript.Tag := 0;
     memoscript.Tag := 0;


    // dm.QryScriptLookup.close;
   //  dm.QryScriptLookup.open;
     dm.Qry_ScriptArq.RestoreSQL;
     dm.Qry_ScriptArq.ExecSQL;
  end;

end;



function TGeradorScript.RetornaValorWhere(vTexto,vSource,vValor:string;clsp: Tinfofield=NIL):string;
begin
   if clsp.Maiusculo then
     vValor := UpperCase(vValor);
   if clsp.RAcentos then
     vValor := DM.retiraracentos(vValor);
   if clsp.Filtro > 0 then
     vValor:= FilterChars(vValor,vFiltros[clsp.Filtro]);
  Result := ReplaceStr(vTexto,vSource,vValor)
end;

function TGeradorScript.FormataValorOpc(str:string;clsp: Tinfofield=NIL):string;
var
  valorformt :string;
begin
  if str = '' then
  begin
    Result := '';
    exit;
  end;
  valorformt := str;
  if clsp.Maiusculo then
    valorformt := UpperCase(valorformt);
  if clsp.RAcentos then
    valorformt := DM.retiraracentos(valorformt);
  if clsp.Filtro > 0 then
    valorformt := FilterChars(valorformt,vFiltros[clsp.Filtro]);
  Result := valorformt;

end;


procedure TGeradorScript.GeraUpdateObsGEral;
var
  vlinha: string;
  vTI: Integer;
  vqtdlinhas: Integer;
  comitar: Integer;
  I: Integer;
  upl: Integer;
  vConteudo: string;
  vsinsert: string;
  vInicio: string;
  dIRoPERACAO: string;
  vlstrvalor: string;
begin
  vlstrvalor := '';
  dIRoPERACAO := '';
  vInicio := '';
  vsinsert := '';
  vConteudo := '';
  upl := 0;
  I := 0;
  comitar := 0;
  vqtdlinhas := 0;
  vTI := 0;
  vlinha := '';

  I := 0;
  vTI := 0;
  comitar := 0;
  AdvMemo1.Lines.Clear;
  dIRoPERACAO := Flocal+'TemArquivos\';
  if not DirectoryExists(dIRoPERACAO) then
    ForceDirectories(dIRoPERACAO);
  AdvMemo1.Lines.Clear;
  sombra(sbUp,'Executando Filtros');

  vsinsert := 'Update '+dm.QryExecuteparamTABELA_DESTINO.Value+' set OBSERVACOES_GERAIS = ';
  IniciaArquivo(dIRoPERACAO+'U_'+dm.QryExecuteparamTABELA_DESTINO.AsString+'Upgeral.SQL');
  vInicio := ' EXECUTE BLOCK  '+#13+
             '         AS  '+#13+
             '         BEGIN '+#13;
  WriteLn(FsArquivo,vInicio);
  WriteLn(FsArquivo,' ALTER '+dm.QryExecuteparamTABELA_DESTINO.AsString +' ADD OBSERVACOES_GERAIS TEXTO_BLOB; ');
  WriteLn(FsArquivo,'END;');
  WriteLn(FsArquivo, 'COMMIT WORK;');
  dm.QrySelect.First;
  PgBarScript.Properties.Min := 0;
  PgbarReg.Properties.Max := dm.QrySelect.RecordCount;
  PgbarReg.Properties.Min := 0;
  PgbarReg.Properties.Max := dm.QrySelect.Fields.Count;
  while not dm.QrySelect.Eof do
  begin
    vlinha := '';
    Application.ProcessMessages;
    vConteudo := '';

    PgbarReg.Position := 0;
    for upl := 0 to pred(dm.QrySelect.Fields.Count) do
    begin


      PgbarReg.Position := PgbarReg.Position+1;
      if dm.QrySelect.Fields[upl].AsString <> '' then
      begin
        if pos('{\rtf1\',dm.QrySelect.Fields[upl].AsString) > 0 then
           vlstrvalor := dm.RetornaTexto(dm.QrySelect.Fields[upl].AsString)
        else
          vlstrvalor := dm.QrySelect.Fields[upl].AsString;
        vConteudo := ifthen(vConteudo='',dm.QrySelect.Fields[upl].FieldName + '='+vlstrvalor,
                     vConteudo+'||ASCII_CHAR(13)||'+dm.QrySelect.Fields[upl].FieldName + '='+vlstrvalor);
      end;
      Application.ProcessMessages;
    end;
    vlinha := vsinsert +vConteudo;
    AdvMemo1.Lines.Add(vLinha);
    WriteLn(FsArquivo, vlinha);
    if (comitar = cxSpEdtcomit.Value) then
    begin
      comitar := 0;
      vLinha :=('COMMIT WORK;');
      WriteLn(FsArquivo, vlinha);
      AdvMemo1.Lines.Add(vLinha);
      AdvMemo1.Lines.Clear;
    end;
    inc(comitar);

    if (vqtdlinhas = integer(cxSpinEdit1.Value)) then
    begin
      vLinha :=('COMMIT WORK;');
      WriteLn(FsArquivo, vlinha);
      CloseFile(FsArquivo);
      gravaProjeto('U_'+dm.QryParaminsTABELA_DESTINO.AsString+'_'+inttostr(vTI)+'Upgeral.Sql','U');
      inc(vTI);
      vqtdlinhas:=0;
      comitar := 0;
      IniciaArquivo(dIRoPERACAO+'U_'+dm.QryExecuteparamTABELA_DESTINO.AsString+inttostr(vTI)+'Upgeral.SQL');
    end;
    if ChkLimitar.Checked then
      inc(vqtdlinhas);
    inc(I);
    dm.QrySelect.Next;
    PgBarScript.Position := PgBarScript.Position +1;
  end;
  vLinha :=('COMMIT WORK;');
  WriteLn(FsArquivo, vlinha);
  CloseFile(FsArquivo);
  inc(vTI);
  gravaProjeto('Upidate'+dm.QryParaminsTABELA_DESTINO.AsString+'_'+inttostr(vTI)+'Upgeral.Sql','U');
  GeraUpdateObsGEral;
end;

procedure TGeradorScript.gravaProjeto(pNome_Arquivo:string;Tipo:string='S';pTabOrigem:string='';pTabDestino:string='';pSQL:string='');
begin
  if length(pTabOrigem+pTabDestino) = 0 then
  begin
    pTabOrigem  := dm.QryParaminsTABELA_ORIGEM.AsString;
    pTabDestino := dm.QryParaminsTABELA_DESTINO.AsString;
  end;


  dm.QryScript.Append;
  dm.QryScriptID_PROJETO.Value            := FPRJID;
  dm.QryScriptTIPO_SCRIPT.Value           := Tipo;
  dm.QryScriptTABELA_DESTINO.Value        := pTabDestino;
  dm.QryScriptTABELA_ORIGEM.Value         := pTabOrigem;
  dm.QryScriptRESPONSAVEL_NOME.Value      := dm.QryProjetoRESPONSAVEL_NOME.Value;
  dm.QryScriptNOME_ARQUIVO.AsString       := pNome_Arquivo;
  dm.QryScriptSCRIPT.Text                 := pSQL;
  if FArquivoSql <> '' then
    dm.QryScriptSCRIPT_ARQ.LoadFromFile(FArquivoSql);
  dm.QryScript.Post;
  dm.QryScript.ApplyUpdates();
  if FArquivoSql <> '' then
    TFile.Delete(FArquivoSql);
  gerabakcupdb;
end;

procedure TGeradorScript.CBconexaoselPropertiesCloseUp(Sender: TObject);
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

function TGeradorScript.TrataParametros(Sql:string):String;
var
   I: Integer;
   parametro,
   valorparam,
   vSql :string;
   classe : Tinfofield;
  vfieldtipoDst: TFieldType;
  vfieldtipoOrg: TFieldType;
begin
  I := 0;
  Result := Sql;
  dm.QryMontaPrSelect.close;
  dm.QryMontaPrSelect.sql.clear;
  dm.QryMontaPrSelect.sql.Text := Sql;
  if dm.QryMontaPrSelect.Params.Count > 0 then
  begin
    try
      classe := Tinfofield.Create;
      for I := 0 to pred(dm.QryMontaPrSelect.Params.Count) do
      begin
        valorparam        := dm.QryMontaPrSelect.Params[I].Name;
        Application.ProcessMessages;
        vfieldtipoDst     := Retornatipofield(dm.QryParaminsTIPODADO_DESTINO.AsString);
        vfieldtipoOrg     := Retornatipofield(dm.QryParaminsTIPODADO_ORIGEM.AsString);
        classe.TipoOrg    := vfieldtipoOrg;
        classe.FTipoDst   := vfieldtipoDst;
        classe.FSizeDst   := dm.QryParaminsTAM_CAMPO_DESTINO.Value;
        classe.FSizeOrg   := dm.QryParaminsTAM_CAMPO_DESTINO.Value;
        classe.ValOrg     := dm.QrySelect.FieldByName(valorparam).Value;

  //      vSql := vSql+ Repla
      end;
    finally
      Freeandnil(classe);
    end;
  end;
end;

FUNCTION TGeradorScript.substituivariaveis(vclsp:Tinfofield):string;
var
  vSQLsub,
  ResValor,
  nomeparam :string;
  I: Integer;
  vclparam: Tinfofield;
  vValorcampo: string;
  vqry :TUniQuery;
begin
  vValorcampo := '';
  I := 0;
  vSQLsub := '';
  Result := vclsp.Rotinasql_prm;
  ResValor := '';
  if (vclsp.Rotinasql_prm <> '') then
  begin
    dm.QryParams.Close;
    dm.QryParams.SQL.Clear;
    dm.QryParams.SQL.Text :=  vclsp.Rotinasql_prm;
    dm.QryParamWhr.filtered := false;
    if dm.QryParams.ParamCount > 0 then
    begin
      ResValor :=  vclsp.Rotinasql_prm;
      try
        vclparam := Tinfofield.Create;
        for I := 0 to pred(dm.QryParams.Params.Count) do
        begin
          dm.QryParamWhr.First;
          nomeparam := dm.QryParams.Params[I].Name;
          if nomeparam = 'CHAVESOFTWIK' then
          begin
            vclparam.TipoOrg          := ftString;
            vclparam.TipoDst          := ftString;
            vclparam.SizeOrg          := 1000;
            vclparam.SizeDst          := 1000;
            vValorcampo               := HashcodeDefault(vclsp);
          end else
          if dm.QryParamWhr.Locate('CAMPO_ORIGEM',UpperCase(nomeparam),[]) then
          begin
            vclparam.TipoOrg          := Retornatipofield(dm.QryParamWhrTIPODADO_ORIGEM.AsString);
            vclparam.TipoDst          := Retornatipofield(dm.QryParamWhrTIPODADO_DESTINO.AsString);
            vclparam.SizeOrg          := dm.QryParamWhrTAM_CAMPO_ORIGEM.AsInteger;
            vclparam.SizeDst          := dm.QryParamWhrTAM_CAMPO_DESTINO.AsInteger;
            vValorcampo               := dm.QrySelect.FieldByName(nomeparam).AsString;
          end;

          if vValorcampo <> '' then
          begin
            if vclsp.OrigemSub = 'D' then
              vSQLsub := FormataSqlTipoCampo(vValorcampo,vclparam.FTipoOrg,vclparam)
            else
               vSQLsub := FormataSqlTipoCampo(vValorcampo,vclparam.FTipoOrg,vclparam);
          end else
            vSQLsub := 'null';
          ResValor := ReplaceStr(ResValor,':'+nomeparam,vSQLsub);
        end;
      finally
        Result := ResValor;
        FreeAndNil(vclparam);
        dm.QryParamWhr.Filtered := false;
      end;
    end;
  end else

end;



FUNCTION TGeradorScript.SubselectSqlRotina(pValor:string;vclsp:Tinfofield):string;
var
  vSQLsub :string;
begin
  vSQLsub := '';
  Result := 'NULL';
  if UPPERCASE(pValor) = 'NULL' then exit;
  if (vclsp.Rotinasql <> '') then
  begin
    dm.QrySelect.FieldByName(dm.QryParaminsCAMPO_ORIGEM.AsString).Value;
    vSQLsub := FormataSqlTipoCampo(pValor,vclsp.FTipoOrg,vclsp);
    Result := ReplaceStr(vclsp.Rotinasql,'@VALOR_ORIGEM@',vSQLsub);
  end else
    Result := pValor;
end;

function TGeradorScript.FormataSqlTipoCampo(pValor:string;vtipo:TFieldType;vclsp:Tinfofield):String;
begin
  if uppercase(pValor) <> 'NULL' then
  BEGIN
    case vtipo of
      ftSmallint, ftInteger, ftWord, ftLargeint, ftLongWord, ftShortint, ftByte :
      begin
        Result := Retsqlint(pValor);
      end;
      ftString, ftMemo, ftWideMemo, ftVarBytes:
      begin
        Result := Retsqlstr(pValor,vclsp);
      end;
      ftFloat, ftCurrency, ftBCD:
      begin
        Result := Retsqldouble(pValor);
      end;
      ftDate, ftTime, ftDateTime, ftTimeStamp:
      begin
        Result := Retsqldatetime(pValor,vclsp);
      end;
      ftBlob:
      begin
        Result := Retsqlstr(pValor,vclsp);
      end;
      ftBoolean:
      begin
      end;
    end;

  END else
    Result := pValor;
end;



procedure TGeradorScript.chkprimarykeyClick(Sender: TObject);
begin
  if chkprimarykey.Checked then
     cxRGSequencia.ItemIndex := 0
  else
     cxRGSequencia.ItemIndex := -1;
end;

procedure TGeradorScript.conectaorigem(pNova:boolean=false);
begin
  try
    dm.CcnOrigem.CLOSE;
    dm.CcnOrigem.ConnectString := '';
    if (FileExists(FNomearq) and  (not pNova)) then
    begin
      FStrList.LoadFromFile(FNomearq);
      dm.CcnOrigem.ConnectString := FStrList.Values['cnOrigem'];
      dm.CcnOrigem.LoginPrompt := false;

    end else
    begin
      dm.CcnOrigem.ConnectString := '';
      dm.CcnOrigem.LoginPrompt := true;
      dm.CcnOrigem.close;
    end;
    dm.CcnOrigem.open;
  finally

  end;
end;



procedure TGeradorScript.cbSistemaPropertiesCloseUp(Sender: TObject);
var
  escolha, letra :String;
  filexml : TFileStream;
begin

  if cbSistema.EditText = '' then exit;
  DBLKCBOrigem.Clear;
  DBLKCBDestino.Clear;
  dm.QryPersonalQueryLoad.close;
  dm.QryPersonalQueryLoad.RestoreSQL;
  dm.QryPersonalQueryLoad.DeleteWhere;
  dm.QryPersonalQueryLoad.AddWhere(' ID_PROJETO ='+inttostr(FPRJID));
  if pos('GERAL',UPPERCASE(cbSistema.EditText)) = 0 then
    dm.QryPersonalQueryLoad.AddWhere(' SISTEMA ='+Quotedstr(cbSistema.EditText) +' OR SISTEMA ='+Quotedstr('G- Geral'));
  dm.QryPersonalQueryLoad.open;
  dm.MDOCDSOrige.close;
  dm.MDOCDSOrige.close;
  escolha := cbSistema.EditText;
  letra := copy(escolha,1,pos('-',escolha)-1)+'_';
  dm.MDDestino.Filtered := false;
  dm.MDDestino.Filter :=  'TABLE_NAME like '+QuotedStr(letra+'%');
  dm.MDDestino.Filtered:=true;
 // StatusBar1.Panels[0].Text := 'Sistema / Tabelas Selecionadas '+copy(escolha,pos('-',escolha),length(escolha));

  dm.MDOCDSOrige.open;
  if CheckBox1.Checked then
  begin
   dm.MDOCDSOrige.SaveToFile(Flocal+'\MDOrigem.xml',dfXMLUTF8);
  end;
  dm.MDDestino.Open;
  if CheckBox1.Checked then
  begin
    //filexml := TFileStream.Create(Flocal+'\MDDestino.xml',0);
    dm.MDDestino.SaveToXML(Flocal+'\MDDestino.xml');
    //Freeandnil(filexml);
  end;
  DM.CDSTabelas.Close;
  DM.CDSTabelas.data := null;
  DM.CDSTabelas.CreateDataSet;
  GPTabelas.Visible := true;
  resetgeral;
  abrirFilhos;
  cbxkeyfield.Clear;
  cbxkeyfield.ClearSelection;
  cbxkeyfield.Properties.Items.Clear;
end;

function TGeradorScript.IniciaConexao:boolean;
begin
  Result := false;
  try
    FNomearq := Flocal+ FProjeto+'.cnx';
    FStrList := TStringList.Create;
    dm.CcnDestino.AfterConnect            := CcnDestinoAfterConnect;
    dm.CcnDestino.AfterDisconnect         := CcnDestinoAfterDisconnect;
    dm.CcnOrigem.AfterDisconnect          := CcnOrigemAfterDisconnect;
    dm.CcnOrigem.AfterConnect             := CcnOrigemAfterConnect;



    if FileExists(Fpahtexe+'\Config.ini') then
    begin
      Result := conectar;
    end;

    if FileExists(FNomearq) then
    begin
      FStrList.loadfromfile(FNomearq);

    end;
    cxPageControl1.ActivePageIndex := 0;

  except
    raise;
  end;
end;

procedure TGeradorScript.lkbarquivoscrpPropertiesEditValueChanged(Sender: TObject);
begin
    //CDSlkcscripts.Locate('id',lkptabelas.Properties.GetLookupField.Value)
    {
  memoarquivo.Lines.Clear;
  memoarquivo.Lines.Add('Criando Script aguarde ...');
  memoarquivo.Lines.Add('Origem dos Dados :'+  dm.QryScriptLookupTABELA_ORIGEM.AsString );
  memoarquivo.Lines.Add('Destino dos Dados :'+ dm.QryScriptLookupTABELA_DESTINO.AsString );
  if (dm.QryScriptLookupTODAS.Value = 0) then
  begin
    dm.Qry_ScriptArq.Close;
    DM.Qry_ScriptArq.Connection := dm.CcnParametros;
    dm.Qry_ScriptArq.RestoreSQL;
    dm.Qry_ScriptArq.DeleteWhere;
    dm.Qry_ScriptArq.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryScriptLookupTABELA_DESTINO.AsString));
    dm.Qry_ScriptArq.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryScriptLookupTABELA_ORIGEM.AsString));
    dm.Qry_ScriptArq.Open;

  end else
  begin
    dm.Qry_ScriptArq.Close;
    DM.Qry_ScriptArq.Connection := dm.CcnParametros;
    dm.Qry_ScriptArq.RestoreSQL;
    dm.Qry_ScriptArq.DeleteWhere;
    dm.Qry_ScriptArq.Open;
  end;
  }
end;

procedure TGeradorScript.lkptabelasPropertiesEditValueChanged(Sender: TObject);
begin
 {
  memoscript.Lines.Clear;
  memoscript.Lines.Add('Criando Script aguarde ...');
  memoscript.Lines.Add('Origem dos Dados :'+  dm.QryConvGeraTABELA_ORIGEM.AsString );
  memoscript.Lines.Add('Destino dos Dados :'+ dm.QryConvGeraTABELA_DESTINO.AsString );

  if (dm.QryConvGeraTODAS.Value = 0) then
  begin
    dm.QryExecuteparam.Close;
    DM.QryExecuteparam.Connection := dm.CcnParametros;
    dm.QryExecuteparam.RestoreSQL;
    dm.QryExecuteparam.DeleteWhere;
    dm.QryExecuteparam.AddWhere(' TABELA_DESTINO = '+QuotedStr(dm.QryConvGeraTABELA_DESTINO.AsString));
    dm.QryExecuteparam.AddWhere(' TABELA_ORIGEM = '+QuotedStr(dm.QryConvGeraTABELA_ORIGEM.AsString));
    dm.QryExecuteparam.Open;
    FTodas := false;
  end else
  begin
    dm.QryExecuteparam.Close;
    DM.QryExecuteparam.Connection := dm.CcnParametros;
    dm.QryExecuteparam.RestoreSQL;
    dm.QryExecuteparam.DeleteWhere;
    dm.QryExecuteparam.Open;
    FTodas := true;

    dm.QryOrdena.Close;
    dm.QryOrdena.RestoreSQL;
    dm.QryOrdena.DeleteWhere;
    dm.QryOrdena.Open;
  end;
  }

end;

procedure TGeradorScript.acEcluirregExecute(Sender: TObject);
begin
  if dm.MsgPerguntaSimNao('Confirma a exclusão do escript selecionado.') then
  begin
    dm.QryScript.Delete;
    dm.QryScript.ApplyUpdates();
  end;
end;

procedure TGeradorScript.acExecsqlscrExecute(Sender: TObject);
begin
  if dm.MsgPerguntaSimNao('Confirma a execução do escript selecionado.') then
    dm.executascript(dm.QryScriptSCRIPT.AsString,cgDestino);
end;

procedure TGeradorScript.atualizabotao(Sender: TObject);
begin
end;

procedure TGeradorScript.FormCreate(Sender: TObject);
begin
  //resetgeral;
  cxPageControl1.ActivePage := cxTabSheet1;
  cxPageControl1.ActivePageIndex := 0;
  pageOpcoes.ActivePageIndex := 0;
  Flocal:=ExtractFilePath(ParamStr(0));
  OpenDialog1.InitialDir :=Flocal;
  SaveDialog1.InitialDir :=Flocal;
  dm.DSProjeto.OnUpdateData := atualizabotao;
  cxTabSheet7.TabVisible := false;
  AdvMemo1.Lines.Clear;
  LerRecentes;
  FTempdir :=  TPath.GetTempPath;
  TbShmodelar.TabVisible := false;
  cxTabSheet2.TabVisible := false;
  cxTabSheet5.TabVisible := false;
  if DebugHook <> 0 then
  begin
    CheckBox1.Checked := true;
    dm.UniSQLMonitor1.Active :=  CheckBox1.Checked;
  end;
  FCHAVESOFTWIK := 'CHAVESOFTWIK';
  //
end;
procedure TGeradorScript.FormDestroy(Sender: TObject);

begin
  SalvaConexao;
  FreeAndNil(FStrList);
  dm.CcnParametros.close;
  gerabakcupdb;
end;

procedure TGeradorScript.gerabakcupdb;
var
  dbarqbkp,
  arquivo :string;
begin
  if dm.CcnParametros.Connected then
  begin
    arquivo := dm.CcnParametros.Database;
    dbarqbkp := copy(arquivo,1,pos('.',arquivo)-1);
    if Tfile.Exists(dbarqbkp+'.bkp') then
      Tfile.delete(dbarqbkp+'.bkp');
    Tfile.Copy(arquivo,dbarqbkp+'.bkp',true);
  end;
end;



procedure TGeradorScript.FormResize(Sender: TObject);
begin
    if Assigned(FShadow) then FShadow.UpdateShadow;
end;

procedure TGeradorScript.FormShow(Sender: TObject);
begin
  memocondicao.Hint :='exemplo :  '+#13+
                      '1 - digite a condição (AND,OR,AND NOT, OR NOT)'+#13+
                      '2 - Campo Base (campo usado para comparar exemplo Pessoa_id'+#13+
                      '2 - Campo Valor (campo de onde vem o valor pra comparar exemplo id_Pessoa'+#13+
                      'separe cada condiçao com ";"(ponto e virgula) exemplo: and pessoa_id = id_pessoa; and nome = nomepesso;';
  resetgeral;
end;

procedure TGeradorScript.WMMove(var Message: TWMMove);
begin
     inherited;
     if Assigned(FShadow) then FShadow.UpdateShadow;
end;

function TGeradorScript.SalvaConexao:boolean;
begin

  if ((dm.CcnOrigem.Connected)) then
  begin
    FStrList.Values['cnOrigem']:= dm.CcnOrigem.ConnectString;
    FStrList.SaveToFile(FNomearq);
  end;
end;


procedure TGeradorScript.SpeedButton1Click(Sender: TObject);
begin
  dm.QryProjeto.edit;
  dm.QryProjetoCONEXAO_ORIGEM.AsString := dm.CcnOrigem.ConnectString;
  dm.QryProjeto.post;
  dm.QryProjeto.ApplyUpdates;
  gerabakcupdb;
end;

procedure TGeradorScript.SpeedButton2Click(Sender: TObject);
begin
  dm.QryProjeto.edit;
  dm.QryProjetoCONEXAO_DESTINO.AsString := dm.CcnDestino.ConnectString;
  dm.QryProjeto.post;
  dm.QryProjeto.ApplyUpdates;
end;

procedure TGeradorScript.SpeedButton3Click(Sender: TObject);
var
  Dir, root: string;
begin
  Dir := '';
  root := '\';
  if SelectDirectory('Selecione um Diretorio',root,Dir,[]) then
    Editlocal.text := Dir;

end;

procedure TGeradorScript.SpeedButton4Click(Sender: TObject);
begin
  // sombra(sbCrt,'Aguarde. ...');
  memocondicao.Lines.Add(trim(edtOper.Text)+' '+trim(EdtCampo.Text)+' '+trim(edtcomp.Text)+' :'+trim(edtValor.Text)+'#'+ifthen(chkm.Checked,'S','N')+'#'+ifthen(chkAc.Checked,'S','N')+'#'+IntToStr(CbFil.ItemIndex));
  edtOper.Clear;
  EdtCampo.Clear;
  edtcomp.Clear;
  edtValor.Clear;
  chkm.Checked := false;
  chkAc.Checked := false;
  CbFil.ItemIndex := 0;
end;

procedure TGeradorScript.sporigemClick(Sender: TObject);
begin
  updatechaves(DBLKCBOrigem.Text, DBLKCBDestino.Text, cbxkeyfieldOrigem.Text, tcOrigem);
end;

procedure TGeradorScript.updatechaves(TabO,TabD,ValorCh:string;tiopo:TtipoChave);
var
  sqlup :string;
  chavesql :string;
begin
  //sombra(sbFree);
  case tiopo of
      tcOrigem : chavesql := ' CHAVE_PRIMARIA_ORIGEM = '+ quotedstr(ValorCh);
     tcDestino : chavesql := ' CHAVE_PRIMARIA_DESTINO = '+ quotedstr(ValorCh);
  end;
  sqlup := 'UPDATE CONVERSAO SET '+#13+
           chavesql +#13+
           ' WHERE  '+#13+
           '       ID_PROJETO = '+inttostr(FPRJID)+' AND '+#13+
           '       TABELA_ORIGEM = '+quotedstr(TabO)+' AND '+#13+
           '       TABELA_DESTINO = '+quotedstr(TabD);
   dm.Executasql(sqlup,cgParametro);
   dm.QryParametros.ExecSQL;
end;

Function TGeradorScript.conectar:boolean;
var
  vIni, vIniMaster: TIniFile;
  vBaseDados: string;
  vUsuario: string;
  vSenha: string;
begin
  dm.CcnDestino.close;
  try
    dm.CcnDestino.LoginPrompt := false;
    dm.CcnDestino.ConnectDialog := nil;

    // dm.unicomBase.close;
    vSenha                        := '';
    vUsuario                      := '';
    vBaseDados                    := '';
    vIni                          := TIniFile.Create(Fpahtexe + 'Config.ini');
    vBaseDados                    := vIni.ReadString('Geral', 'BaseDados', '');
    vUsuario                      := vIni.ReadString('Geral', 'Usuario', '');
    vSenha                        := vIni.ReadString('Geral', 'Senha', '');
    vBaseDados                    := Cripto.CriptoHexToText(vBaseDados);
    vUsuario                      := Cripto.CriptoHexToText(vUsuario);
    vSenha                        := Cripto.CriptoHexToText(vSenha);
    dm.CcnDestino.ConnectString   := 'Provider Name=InterBase ;Database='+vBaseDados+';User ID='+vUsuario+';Password='+vSenha+';Login Prompt=False';
    dm.CcnDestino.Open;
    Result                        := dm.CcnDestino.Connected;
    conectaorigem;
  except
    raise;
  end;
end;

procedure TGeradorScript.CRDBGrid1DblClick(Sender: TObject);
begin
  formEditorSql:=TformEditorSql.AbreEditorSQL(dm.QryPersonalQueryQRY_TEXT.AsString,dm.QryPersonalQueryQRY_NOME.AsString,dm.QryPersonalQueryQRY_OBS.AsString,dm.QryPersonalQuerySISTEMA.AsString,true);
  if formEditorSql.FConfirmar then
  begin
    dm.QryPersonalQuery.edit;

    dm.QryPersonalQueryQRY_TEXT.AsString  := formEditorSql.sqlmemo.Lines.Text;
    dm.QryPersonalQueryQRY_OBS.AsString   := formEditorSql.MmObs.Lines.Text;
    dm.QryPersonalQuery.Post;
    dm.QryPersonalQuery.ApplyUpdates();
    gerabakcupdb;
  end;
  FreeAndNil( formEditorSql);
end;

procedure TGeradorScript.filtratipo(filtro:string);
begin
  dm.CDSTVOrigem.Filtered := false;
  if filtro <> '' then
  begin
    dm.CDSTVOrigem.Filter   := filtro;
    dm.CDSTVOrigem.Filtered := true;
  end;
end;

procedure TGeradorScript.ChkBWhereClick(Sender: TObject);
begin
  MmWhere.Lines.Clear;
  memocondicao.Lines.Clear;

  RGWhere.Enabled := ChkBWhere.Checked;
  MmWhere.Enabled := ChkBWhere.Checked;
  memocondicao.Enabled := ChkBWhere.Checked;
  Label30.Enabled := ChkBWhere.Checked;
  case ChkBWhere.Checked of
     true: begin
             RGWhere.ItemIndex := 0;
             whererotina(1);
           end;
    false: RGWhere.ItemIndex := -1;
  end;
end;

procedure TGeradorScript.ChkLimitarClick(Sender: TObject);
begin
   cxSpinEdit1.Visible :=  ChkLimitar.Checked;
end;

procedure TGeradorScript.cxCheckBox2Click(Sender: TObject);
begin


    ShowMessage('Esta rotina quando ativa gera um campo hash md5 dos campos '+#13+
                'que você selecionar na associação  criando assim uma chave '+#13+
                'única  dos  dados  inseridos para  através do  script para '+#13+
                'futuras  conferências  ou  verificação.  Selecione  campos '+#13+
                'com valores únicos para montar o hash na hora de associar. '+#13+
                'Ex: (cpf, nome, chaves primarias, datas nomes etc)');

end;

procedure TGeradorScript.cxComboBox1PropertiesCloseUp(Sender: TObject);
begin
   case CBxTipo.ItemIndex of
    0: filtratipo('');
    1: filtratipo('TABLE_TYPE = '+quotedstr('TABLE'));
    2: filtratipo('TABLE_TYPE = '+quotedstr('VIEW'));
    3: filtratipo('TABLE_TYPE = '+quotedstr('SELECT'));
  end;
end;

procedure TGeradorScript.verificagrava;
begin
   if dm.QryProjeto.State IN [dsInsert,dsEdit] THEN dm.QryProjeto.Post;
  if dm.QryProjeto.UpdatesPending then
    dm.QryProjeto.ApplyUpdates();
  gerabakcupdb;
end;

procedure TGeradorScript.cxDBTextEdit6Exit(Sender: TObject);
begin
  verificagrava;
end;

procedure TGeradorScript.cxDBTextEdit7Exit(Sender: TObject);
begin
  verificagrava;
end;

procedure TGeradorScript.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  if TForm2.abreform(dm.QryParametrosID.AsString) then
    dm.QryParametros.ExecSQL;
end;

Procedure TGeradorScript.atualizascriptscds;
begin

  dm.QryExecuteparam.Close;
  DM.QryExecuteparam.Connection := dm.CcnParametros;
  dm.QryExecuteparam.RestoreSQL;
  dm.QryExecuteparam.DeleteWhere;
  dm.QryExecuteparam.Open;
  FTodas := true;

{
  dm.QryScriptLookup.Close;
  DM.QryScriptLookup.Connection := dm.CcnParametros;
  dm.QryScriptLookup.open;
  dm.QryScriptLookup.Locate('TODAS',1,[]);
  dm.QryConvGera.close;
  dm.QryScriptLookup.Locate('TODAS',1,[]);
  dm.QryConvGera.Open;

  if lkptabelas.ItemIndex = -1 then
    lkptabelas.ItemIndex := 0;
  if lkbarquivoscrp.ItemIndex = -1 then
    lkbarquivoscrp.ItemIndex := 0;
  lkptabelas.EditValue := 0;

  Label24.Caption := 'Atenção'+#13+'¯¯¯¯¯¯¯'+#13+'Se escolheu executar dodos os scripts antes de executar selecione a ordem de execução no campo ordem.';
  }
  end;

procedure TGeradorScript.setaconexaoeditor;
  begin
    CBconexaosel.ItemIndex := 0;
    CBconexaoselPropertiesCloseUp(nil);
  end;

procedure TGeradorScript.cxPageControl1Change(Sender: TObject);
begin
  case (cxPageControl1.ActivePageIndex) of
    0:;
    1:;
    2:atualizascriptscds;
    3:setaconexaoeditor;
  end;
end;


function TGeradorScript.pegaGeracaoChave(TbO,TbD:string):String;
begin
  Result := '';
  dm.QryC_ORDEM.close;
  dm.QryC_ORDEM.RestoreSQL;
  dm.QryC_ORDEM.DeleteWhere;
  dm.QryC_ORDEM.AddWhere('TABELA_ORIGEM ='+QuotedStr(TbO));    //));
  dm.QryC_ORDEM.AddWhere('TABELA_DESTINO ='+QuotedStr(TbD));     //));
  dm.QryC_ORDEM.AddWhere('ID_PROJETO ='+IntToStr(FPRJID));
  dm.QryC_ORDEM.Open;
  if not dm.QryC_ORDEM.IsEmpty then
  begin
    Result := trim(dm.QryC_ORDEMORIGEM_G_CHAVE.value);
  end;
end;

procedure TGeradorScript.cxRGSequenciaPropertiesChange(Sender: TObject);
begin
  lbexplicaacao.Visible   := false;
  lbexplicaacao.Align     := alTop;
  lbexplicaacao.Height    := 32;
  cxSEvalor.Value         := 0;
  cxSEvalor.Enabled       := false;
  lbvalor.Enabled         := false;
  TAbSeq.ActivePageIndex := 0;
  case cxRGSequencia.ItemIndex of
    0:begin
        lbexplicaacao.Visible := true;
        lbexplicaacao.Align := alClient;
        lbexplicaacao.Caption := 'Esta opção insere o registro e gera sequencia igual e feito no sistema sem alterções nem mudanças';
    end;
    1:begin
        lbexplicaacao.Visible := true;
        lbexplicaacao.Caption := 'Esta opção insere o registro e gera e soma ao valor gerado o numero expecificado no campo valor';
    end;
    2:begin
        lbexplicaacao.Visible := true;
        lbexplicaacao.Caption := 'Esta opção insere o registro e gera a sequencia e subtrai do valor gerado o numero expecificado no campo valor';
    end;
    3:begin
        lbexplicaacao.Visible := true;
        lbexplicaacao.Caption := 'Esta opção altera o valor da sequencia para um numero expecifico e continua apartir dai';
    end;
    4:begin
        TAbSeq.ActivePageIndex := 1;
        editSeqNOme.Text := 'SEQ_CONV_'+DM.CDSTabelasTabelaDestino.Value;
        //lbexplicaacao.Caption := 'Esta opção insere o registro e gera e soma ao valor gerado o numero expecificado no campo valor';
    end;
  end;
  if ((cxRGSequencia.ItemIndex > 0) and (cxRGSequencia.ItemIndex < 4)) then
  begin
    cxSEvalor.Enabled := cxRGSequencia.ItemIndex > 0;
    lbvalor.Enabled := cxRGSequencia.ItemIndex > 0;
  end;
end;

procedure TGeradorScript.cxTabSheet17Show(Sender: TObject);
begin
  btnGrava.Enabled := false;
end;

procedure TGeradorScript.DBGrid1DblClick(Sender: TObject);
begin
  editorsqlmemo.Lines.Add('Select * from '+dm.MdSelector.fieldbyname('TABLE_NAME').AsString);
 // editorsqlmemo.sel
 // editorsqlmemo.sele
end;

procedure TGeradorScript.DBLkCBCampoDestinoPropertiesCloseUp(Sender: TObject);
begin
  tabAlterar.Enabled := false;
  cxpageopschar.ActivePageIndex := 0;
  pageOpcoes.ActivePageIndex := 0;
  if CDSDestino.Locate('nome',DBLkCBCampoDestino.EditText,[]) then
  begin
    edittipoDestino.Text := CDSDestinonomeTipo.AsString;
    edsizeDestino.Text   := IntToStr(CDSDestinosize.Value);
    if ((IndexText(CDSDestinonomeTipo.Value,['ftString', 'ftMemo', 'ftWideMemo']) >= 0) or (IndexText(CDSOrigemnomeTipo.Value,['ftString', 'ftMemo', 'ftWideMemo'])>= 0)) then
    begin

     tabAlterar.Enabled := true;
    end;
    if CDSDestinoPosChavePrimaria.Value then
      pageOpcoes.ActivePageIndex := 0;
    dm.QryParametros.Locate('TABELA_DESTINO;CAMPO_DESTINO',VarArrayOf([CDSDestinoTabela.AsString,CDSDestinonome.AsString]),[]);
  end;
  if CDSCAMPOS_D.State in [dsEdit,dsInsert] then
    CDSCAMPOS_D.Post;

end;

procedure TGeradorScript.DBLkCBCampoDestinoPropertiesInitPopup(Sender: TObject);
begin
  if CDSCAMPOS_D.IsEmpty then
    CDSCAMPOS_D.Append
  else
    CDSCAMPOS_D.Edit;
end;

procedure TGeradorScript.DBLkCBCampoOrigemPropertiesCloseUp(Sender: TObject);
begin
  if CDSOrigem.Locate('nome',DBLkCBCampoOrigem.EditText,[]) then
  begin
    edittipoOrigem.Text := CDSOrigemnomeTipo.AsString;
    edsizeOrigem.Text   := IntToStr(CDSOrigemsize.Value);
    dm.QryParametros.Locate('TABELA_ORIGEM;CAMPO_ORIGEM',VarArrayOf([CDSOrigemTabela.AsString,CDSOrigemnome.AsString]),[]);
    chkUDK.Checked:= true;
  end;
  if CDSCAMPOS_O.State in [dsEdit,dsInsert] then
    CDSCAMPOS_O.Post;

end;

procedure TGeradorScript.DBLkCBCampoOrigemPropertiesInitPopup(Sender: TObject);
begin
  if CDSCAMPOS_O.IsEmpty then
    CDSCAMPOS_O.Append
  else
    CDSCAMPOS_O.Edit;
end;

procedure TGeradorScript.DBLKCBDestinoPropertiesCloseUp(Sender: TObject);
var
  I: Integer;
  vTabela: string;
  vPrimary: string;

  function pegaprimarykey(tabela:string):String;
  begin
    Result := '';
    dm.MDColunas.Filtered := false;
    dm.MDColunas.close;
    dm.MDColunas.Restrictions.Values['TABLE_NAME'] := tabela;
    dm.MDColunas.MetaDataKind := 'IndexColumns';
    dm.MDColunas.Restrictions.Values['CONSTRAINT_TYPE'] := 'PRIMARY KEY';
    dm.MDColunas.Open;
    dm.MDColunas.Filter := 'INDEX_NAME LIKE '+quotedstr('%PK%');
    dm.MDColunas.Filtered := true;
    if not dm.MDColunas.IsEmpty then
       Result := dm.MDColunas.FieldByName('COLUMN_NAME').AsString;
  end;
begin
  vPrimary := '';
  vTabela := '';
  if DBLKCBDestino.EditText = '' then exit;
  if dm.MDDestino.Locate('TABLE_NAME',DBLKCBDestino.EditValue,[]) then
  BEGIN
    dm.MDField.Close;
    dm.MDField.Connection := dm.CcnDestino;
    dm.MDField.Restrictions.Values['TABLE_NAME']:= DBLKCBDestino.EditValue;
    vPrimary := pegaprimarykey(DBLKCBDestino.EditValue);
    dm.LdColum.Connection :=  dm.CcnDestino;
    dm.LdColum.Columns.Clear;
    dm.LdColum.SpecificOptions.Values['RowsPerBatch'] := '1';
    dm.LdColum.TableName := DBLKCBDestino.EditValue;
    dm.LdColum.Load;
    vTabela := DBLKCBDestino.EditValue;
    CDSDestino.Close;
    CDSDestino.Data := null;
    CDSDestino.CreateDataSet;
    CDSDestino.Append;
    CDSDestinoid.Value             := -1;
    CDSDestinoidxcampo.Value       := -1;
    CDSDestinonome.Value           := 'CRIARCAMPO';
    CDSDestinonomeTipo.Value       := GetEnumName(TypeInfo(TFieldType),integer(ftUnknown));
    CDSDestinonumTipo.Value        := integer(ftUnknown);
    CDSDestinoTabela.AsString      := DBLKCBDestino.EditValue;
    CDSDestino.Post;
    for I := 0 to dm.LdColum.Columns.Count - 1 do
    begin
      dm.MDField.Close;
      CDSDestino.Append;
      CDSDestinoid.Value                            := dm.LdColum.Columns.Items[I].Index;
      CDSDestinoidxcampo.Value                      := dm.LdColum.Columns.Items[I].Index;
      CDSDestinonome.Value                          := dm.LdColum.Columns.Items[I].Name;
      CDSDestinonomeTipo.Value                      := GetEnumName(TypeInfo(TFieldType),integer(dm.LdColum.Columns.Items[I].FieldType));
      dm.MDField.Restrictions.Values['COLUMN_NAME'] := dm.LdColum.Columns.Items[I].Name;
      dm.MDField.Open;
      CDSDestinoNomeChavepk.AsString                := (uppercase(copy(vTabela,pos('_',vTabela)+1,length(vTabela))+'_ID'));
      CDSDestinonumTipo.Value                       := integer(dm.LdColum.Columns.Items[I].FieldType);
      CDSDestinosize.Value                          := StrToIntDef(dm.MDField.FieldByName('DATA_LENGTH').AsString,0);
      CDSDestinoAceita_Null.Value                   := dm.MDField.FieldByName('NULLABLE').AsInteger = 1;
      CDSDestinoOrdem.Value                         := dm.MDField.FieldByName('POSITION').Value;
      CDSDestinoPosChavePrimaria.Value              := ((dm.MDField.FieldByName('NULLABLE').Value = 0) and (vPrimary = uppercase(dm.LdColum.Columns.Items[I].Name)));
      CDSDestinoTabela.AsString                     :=  DBLKCBDestino.EditValue;
      CDSDestino.Post;
    end;
    resetgeral;
    abrirFilhos;
  END;
  if not CDSDestino.IsEmpty then
  begin
    cbxkeyfield.Clear;
    cbxkeyfield.ClearSelection;
    cbxkeyfield.Properties.Items.Clear;
    CDSDestino.DisableControls;
    CDSDestino.First;
    while not CDSDestino.Eof do
    begin
      cbxkeyfield.Properties.Items.Add(CDSDestinonome.AsString);
      CDSDestino.Next;
    end;
    CDSDestino.EnableControls;
  end;
  if not dm.QryParametros.IsEmpty then
  begin
    dm.QryParametros.First;
    cbxkeyfield.ItemIndex := cbxkeyfield.Properties.Items.IndexOf(dm.QryParametrosCHAVE_PRIMARIA_DESTINO.AsString);
    cbxkeyfieldOrigem.ItemIndex := cbxkeyfieldOrigem.Properties.Items.IndexOf(dm.QryParametrosCHAVE_PRIMARIA_ORIGEM.AsString);
  end;


end;

procedure TGeradorScript.DBLKCBOrigemPropertiesCloseUp(Sender: TObject);
var
  I: Integer;
begin
  if DBLKCBOrigem.EditText = '' then exit;
  if dm.CDSTVOrigem.Locate('TABLE_NAME',DBLKCBOrigem.EditValue,[]) then
  begin

    CDSOrigem.Close;
    CDSOrigem.Data := null;
    CDSOrigem.CreateDataSet;

    CDSOrigChave.Close;
    CDSOrigChave.Data := null;
    CDSOrigChave.CreateDataSet;

    (*
    CDSOrigem.Append;
    CDSOrigemid.Value         := -1;
    CDSOrigemnome.Value       := '1PERSONALFIELD';
    CDSOrigemnomeTipo.Value   := 'ftString';
    CDSOrigemnumTipo.Value    := 1;
    CDSOrigemsize.Value       := 1;
    CDSOrigemTabela.AsString  := DBLKCBOrigem.EditValue;
    CDSOrigem.Post;
    *)

    if dm.CDSTVOrigemTABLE_TYPE.AsString = 'SELECT' then
    begin
      if dm.QryPersonalQueryload.Locate('QRY_NOME',DBLKCBOrigem.EditValue,[]) then
      begin
        dm.QrySelectPrj.Close;
        dm.QrySelectPrj.Fields.Clear;
        dm.QrySelectPrj.SQL.Clear;
        dm.QrySelectPrj.sql.Text := dm.QryPersonalQueryloadQRY_TEXT.AsString;
        dm.QrySelectPrj.Open;
        for I := 0 to dm.QrySelectPrj.Fields.Count - 1 do
        begin
          dm.MDField.Close;
          CDSOrigem.Append;
          CDSOrigemid.Value         := dm.QrySelectPrj.Fields[I].Index;
          CDSOrigemnome.Value       := uppercase(dm.QrySelectPrj.Fields[I].FieldName);
          CDSOrigemnomeTipo.Value   := GetEnumName(TypeInfo(TFieldType),integer(dm.QrySelectPrj.Fields[I].DataType));
          CDSOrigemnumTipo.Value    := integer(dm.QrySelectPrj.Fields[I].DataType);
          CDSOrigemsize.Value       := dm.QrySelectPrj.Fields[I].Size;
          CDSOrigemTabela.AsString  := DBLKCBOrigem.EditValue;
          CDSOrigemCheckChave.Value := true;
          CDSOrigem.Post;
        end;

      end;

    end else
    begin
      dm.MDField.Close;
      dm.MDField.Connection := dm.CcnOrigem;
      dm.MDField.Restrictions.Values['TABLE_NAME']:= DBLKCBOrigem.EditValue;
      dm.LdColum.Columns.Clear;
      dm.LdColum.Connection := dm.CcnOrigem;
      dm.LdColum.TableName := '';
      dm.LdColum.TableName := DBLKCBOrigem.EditValue;
      dm.LdColum.Load;
      for I := 0 to dm.LdColum.Columns.Count - 1 do
      begin
        dm.MDField.Close;
        CDSOrigem.Append;
        CDSOrigemid.Value       := dm.LdColum.Columns.Items[I].Index;
        CDSOrigemnome.Value     := dm.LdColum.Columns.Items[I].Name;
        CDSOrigemnomeTipo.Value := GetEnumName(TypeInfo(TFieldType),integer(dm.LdColum.Columns.Items[I].FieldType));
        dm.MDField.Restrictions.Values['COLUMN_NAME']:= dm.LdColum.Columns.Items[I].Name;
        dm.MDField.Open;
        CDSOrigemnumTipo.Value  := integer(dm.LdColum.Columns.Items[I].FieldType);
        CDSOrigemsize.Value     := StrToIntDef(dm.MDField.FieldByName('DATA_LENGTH').AsString,0);
        CDSOrigemTabela.AsString  := DBLKCBOrigem.EditValue;
        CDSOrigem.Post;
      end;
    end;
  end;
  resetgeral;
  DBLKCBDestino.ClearSelection;
  dm.QryParametros.Close;
  dm.QryPersonalFields.Close;
  dm.QryPERSONALWHERES.Close;
  dm.QrySubstQueries.close;
  dm.QryScript.Close;
  cbxkeyfield.Clear;
  cbxkeyfield.ClearSelection;
  cbxkeyfield.Properties.Items.Clear;
   if not CDSOrigem.IsEmpty then
  begin
    cbxkeyfieldOrigem.Clear;
    cbxkeyfieldOrigem.ClearSelection;
    cbxkeyfieldOrigem.Properties.Items.Clear;
    CDSOrigem.DisableControls;
    CDSOrigem.First;
    cbxkeyfieldOrigem.Properties.Items.Add(FCHAVESOFTWIK);
    while not CDSOrigem.Eof do
    begin
      cbxkeyfieldOrigem.Properties.Items.Add(CDSOrigemnome.AsString);
      CDSOrigem.Next;
    end;
    CDSOrigem.EnableControls;
    CDSOrigChave.Data := CDSOrigem.Data;
  end;





end;

procedure TGeradorScript.DeletarCombinao1Click(Sender: TObject);
begin
  if dm.MsgPerguntaSimNao('Ao clicar em sim todos os registros de combinação pra estaas tabelas ['+dm.QryExecuteparam.FieldByName('TABELA_ORIGEM').AsString+' & '+dm.QryExecuteparam.FieldByName('TABELA_DESTINO').AsString+'] serao apagados. confirma?') then
  begin
    DeletaAssociacaoGeral(dm.QryExecuteparam.FieldByName('TABELA_ORIGEM').AsString,dm.QryExecuteparam.FieldByName('TABELA_DESTINO').AsString);
    dm.QryExecuteparam.Execute;
  end;
end;

procedure TGeradorScript.Deletarregistro1Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?','Exclusão',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    DM.QryExecuteparam.Delete;
    DM.QryExecuteparam.ApplyUpdates();
    gerabakcupdb;
  end;
end;

procedure TGeradorScript.DeletarScript1Click(Sender: TObject);
begin
  if Application.MessageBox('Confirma a exclusão deste registro?','Exclusão',MB_YESNO+MB_ICONQUESTION) = mrYes then
  begin
    DM.Qry_ScriptArq.Delete;
    DM.Qry_ScriptArq.ApplyUpdates();
    gerabakcupdb;
  end;
end;

procedure TGeradorScript.Fechar1Click(Sender: TObject);
begin
  dm.CcnDestino.AfterConnect            := CcnDestinoAfterConnect;
  dm.CcnDestino.AfterDisconnect         := CcnDestinoAfterDisconnect;
  dm.CcnOrigem.AfterDisconnect          := CcnOrigemAfterDisconnect;
  dm.CcnOrigem.AfterConnect             := CcnOrigemAfterConnect;
  dm.CcnParametros.close;
  dm.CcnOrigem.Close;
  dm.CcnDestino.Close;
  NovoProjeto1.Enabled                  := true;
  AbrirProjeto1.Enabled                 := true;
  Fechar1.Enabled                       := false;
  vItem.Enabled                         := true;
  EdiotordeConsultasSql1.Enabled        := false;


end;

procedure TGeradorScript.CcnDestinoAfterConnect(Sender: TObject);
begin
  lbbancolocal.Caption                                :=  dm.CcnDestino.Server + ' - '+ dm.CcnDestino.Database;
  lbstlocal.Caption                                   := 'Conectado';
  btnlocal.Caption                                    := '&Desconectar';
  GroupBox3.Repaint;
  GroupBox3.Update;
end;

function TGeradorScript.Retornatipofield(pStrtyp:String):TFieldType;
begin
  Result := TFieldType((GetEnumValue(TypeInfo(TFieldType), pStrtyp)));
end;

procedure TGeradorScript.CcnDestinoAfterDisconnect(Sender: TObject);
begin
  lbbancolocal.Caption                                := '...';
  lbstlocal.Caption                                   := 'Desconectado';
  btnlocal.Caption                                    := '&Conectar';
end;

procedure TGeradorScript.CcnOrigemAfterConnect(Sender: TObject);
begin
  lbbancotitulo.Caption                               := dm.CcnOrigem.Server + ' - '+ dm.CcnOrigem.Database;
  lbbancotitulo.Repaint;
  lbsttitulo.Caption                                  := 'Conectado';
  lbsttitulo.Repaint;
  btntitulo.Caption                                   := '&Desconectar';
  btntitulo.Repaint;
  GroupBox1.Update;
end;

procedure TGeradorScript.CcnOrigemAfterDisconnect(Sender: TObject);
begin
  lbbancotitulo.Caption                                   := '...';
  lbsttitulo.Caption                                   := 'Desconectado';
  btntitulo.Caption                                    := '&Conectar';
end;

procedure TGeradorScript.CheckBox1Click(Sender: TObject);
begin
  dm.UniSQLMonitor1.Active :=  CheckBox1.Checked;
end;

procedure TGeradorScript.CHKAssociarClick(Sender: TObject);
begin
  sqlmemoAssocD.Lines.Clear;
  sqlmemoAssocO.Lines.Clear;
  (*
  case CHKAssociar.Checked of
    true :sqlmemoSUB.Lines.Text := 'Select first 1 '+DBLkCBCampoDestino.EditText +' from tabela where DESCRICAO = :'+DBLkCBCampoOrigem.EditText;
    false :sqlmemoSUB.Lines.Clear;
  end;
  *)
  PgAssoc.Enabled := CHKAssociar.Checked;
end;

procedure TGeradorScript.ChkBCaracteresClick(Sender: TObject);
begin
  GroupBox9.Visible := ChkBCaracteres.Checked;
end;

{$region 'funcoes de tratamento'}

procedure TGeradorScript.NovoProjeto1Click(Sender: TObject);
var
  vresult: Boolean;
begin
  vresult := True;
  try
    try
      SaveDialog1.DefaultExt := '.sdb';
      SaveDialog1.FileName := 'NovoScript';
      SaveDialog1.Filter := '(Projeto Script) *.sdb|*.sdb';
      SaveDialog1.Options := [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing];
      SaveDialog1.Title := 'Escolha um nome e salve o projeto';
   //   if not IniciaConexao then
    //  begin
    //    vresult := false;
    //  end;


      if Application.MessageBox('As bases selecionadas sao mesmo as que pretende usar neste projeto?','Novo Projeto',MB_YESNO+MB_ICONQUESTION)= mrYes then
      begin
        if SaveDialog1.Execute(0) then
        begin
          AbreArquivoprojeot(SaveDialog1.FileName,true);
        end;


        {

          dm.CcnParametros.close;
          dm.CcnParametros.Database := SaveDialog1.FileName;
          dm.CcnParametros.Open;
          dm.Scriptparametro.Execute;
          Flocal := ExtractFilePath(SaveDialog1.FileName);
          FProjeto := ChangeFileExt(ExtractFileName(SaveDialog1.FileName),'');
         // dm.Scriptparametro.Execute;

          dm.QryProjeto.OPEN;
          dm.QryProjeto.Append;
          FPRJID :=   Round(random(99999));
          dm.QryProjetoID.Value               := FPRJID;
          dm.QryProjetoPROJETO_NOME.Value     := ExtractFileName(FProjeto);
          dm.QryProjetoCONEXAO_ORIGEM.Value   := dm.CcnOrigem.ConnectString;
          dm.QryProjetoCONEXAO_DESTINO.Value  := dm.CcnDestino.ConnectString;
          dm.QryProjetoDATA_PROJETO.Value     := NOW;
          dm.QryProjeto.Post;
          dm.QryProjeto.ApplyUpdates();
          vresult:= abrirFilhos;
          gerabakcupdb;
          gravarecente(SaveDialog1.FileName);
          }


      end;
    except
      vresult := false;
    end;


  finally
     if vresult then
     begin
       NovoProjeto1.Enabled := false;
       AbrirProjeto1.Enabled := false;
       Fechar1.Enabled := true;
       vItem.Enabled := false;
     end;
  end;

end;

procedure TGeradorScript.PopupMenu2Popup(Sender: TObject);
begin
  DeletarScript1.Enabled   := false;
  DeletarCombinao1.Enabled := false;
  DeletaRegistro1.Enabled  := false;
  EditarCombinao1.Enabled  := false;
  DeletarCombinao1.Enabled := TPopupMenu(Sender).PopupComponent.Name = 'cxGrid3';
  EditarCombinao1.Enabled  := TPopupMenu(Sender).PopupComponent.Name = 'cxGrid3';
  DeletarScript1.Enabled   := TPopupMenu(Sender).PopupComponent.Name = 'cxGrid4';
  DeletaRegistro1.Enabled  := TPopupMenu(Sender).PopupComponent.Name = 'cxGrid1';
end;

Procedure TGeradorScript.gravarecente(arquivo:string);
var
  I: Integer;
  vexiteja: Boolean;
begin
  try
    try
      vexiteja := false;
      I := 0;
      FlistaRecentes := Tstringlist.Create;
      try
        if fileexists(ExtractFilePath(ParamStr(0))+'gdsptrecents.lst') then
        begin
          FlistaRecentes.LoadFromFile(ExtractFilePath(ParamStr(0))+'gdsptrecents.lst');
          for I := 0 to pred(FlistaRecentes.Count) do
            if ((arquivo) = (FlistaRecentes.strings[I])) then
            begin
              FlistaRecentes.Delete(I);
              break;
            end;

          if FlistaRecentes.Count > 5 then
              FlistaRecentes.Delete(5);
        end ;
        FlistaRecentes.Append(arquivo);



      finally
        FlistaRecentes.SaveToFile(ExtractFilePath(ParamStr(0))+'gdsptrecents.lst');

      end;
    finally
       FreeAndNil(FlistaRecentes);
    end;
    except on e: exception do
    begin
      ShowMessage('Erro executando gravarecente '+e.Message);
      raise;
    end;

  end;
end;

Procedure TGeradorScript.LerRecentes;
var
  I: Integer;

begin
  vItem := nil;
  I := 0;
  try

  FlistaRecentes := Tstringlist.Create;
  if not fileexists(ExtractFilePath(ParamStr(0))+'gdsptrecents.lst') then exit;
  try

      FlistaRecentes.LoadFromFile(ExtractFilePath(ParamStr(0))+'gdsptrecents.lst');
      if FlistaRecentes.Count > 0 then
       vItem:= CrimenuRecentes('Projetos Recentes',Arquivo1,false);
      for I := 0 to pred(FlistaRecentes.Count) do
      begin
        CrimenuRecentes(FlistaRecentes.Strings[I],vItem);
      end;



  finally
    FreeAndNil(FlistaRecentes);
  end;


    except on e: exception do
    begin
      ShowMessage('Erro executando LerRecentes '+e.Message);
      raise;
    end;

  end;
end;

function TGeradorScript.CrimenuRecentes(menu:string;Item:TMenuItem=nil;vclick:boolean = true):TMenuItem;
var
I : Integer;
NovoItem : TMenuItem;
begin
  try
    NovoItem := TMenuItem.Create(MainMenu1);
    NovoItem.Caption := menu;
    if vclick then
      NovoItem.OnClick :=  clickmenurecetntes;
    Item.Add(NovoItem);
    Result := NovoItem;
 //   NovoItem.Free;
// Arquivo1
    except on e: exception do
    begin
      ShowMessage('Erro executando CrimenuRecentes '+e.Message);
      raise;
    end;


  end;

end;

procedure TGeradorScript.clickmenurecetntes(Sender: TObject);
var
  capt :string;
begin
 capt := TMenuItem(Sender).Caption;
 capt := ReplaceStr(capt,'&','');
  AbreArquivoprojeot(capt);
end;



function TGeradorScript.abrirFilhos:boolean;
begin
  Result := true;
  try
    dm.QryParametros.Close;
    dm.QryParametroEdit.Close;
    dm.QryPersonalFields.Close;
    dm.QryPERSONALWHERES.Close;
    dm.QrySubstQueries.close;
    dm.QryScript.Close;
    dm.QrySubstView.Close;
    dm.QryParametros.Connection := dm.CcnParametros;
    dm.QryPersonalFields.Connection := dm.CcnParametros;
    dm.QryPERSONALWHERES.Connection := dm.CcnParametros;
    dm.QrySubstQueries.Connection := dm.CcnParametros;
    dm.QryScript.Connection := dm.CcnParametros;
    dm.QrySubstView.Connection := dm.CcnParametros;

    if ((length(DBLKCBOrigem.EditText)>0) AND (length(DBLKCBDestino.EditText)>0)) then
    begin


      dm.QryParametros.RestoreSQL;
      dm.QryParametros.DeleteWhere;
      dm.QryParametros.AddWhere(' CV.TABELA_DESTINO = '+QuotedStr(DBLKCBDestino.EditValue));
      dm.QryParametros.AddWhere(' CV.TABELA_ORIGEM = '+QuotedStr(DBLKCBOrigem.EditValue));
      dm.QryParametros.Open;


      dm.QryParametroEdit.RestoreSQL;
      dm.QryParametroEdit.DeleteWhere;
      dm.QryParametroEdit.FilterSQL := '1 = 1 AND CV.TABELA_DESTINO = '+QuotedStr(DBLKCBDestino.EditValue)+#13+
                                       ' AND CV.TABELA_ORIGEM = '+QuotedStr(DBLKCBOrigem.EditValue);



      dm.QryPERSONALWHERES.RestoreSQL;
      dm.QryPERSONALWHERES.DeleteWhere;
      dm.QryPERSONALWHERES.AddWhere(' TABELA_DESTINO = '+QuotedStr(DBLKCBDestino.EditValue));
      dm.QryPERSONALWHERES.AddWhere('  TABELA_ORIGEM = '+QuotedStr(DBLKCBOrigem.EditValue));
      dm.QryPERSONALWHERES.Open;


      dm.QryPersonalFields.RestoreSQL;
      dm.QryPersonalFields.DeleteWhere;
      dm.QryPersonalFields.AddWhere(' TABELA_DESTINO = '+QuotedStr(DBLKCBDestino.EditValue));
      dm.QryPersonalFields.AddWhere('  TABELA_ORIGEM = '+QuotedStr(DBLKCBOrigem.EditValue));
      dm.QryPersonalFields.Open;


      dm.QrySubstQueries.RestoreSQL;
      dm.QrySubstQueries.DeleteWhere;
      dm.QrySubstQueries.AddWhere(' TABELA_DESTINO ='+QUOTEDSTR(DBLKCBDestino.EditValue));
      dm.QrySubstQueries.AddWhere('  TABELA_ORIGEM = '+QuotedStr(DBLKCBOrigem.EditValue));
      dm.QrySubstQueries.Open;


      dm.QryScript.RestoreSQL;
      dm.QryScript.DeleteWhere;
      dm.QryScript.AddWhere(' TABELA_DESTINO = '+QuotedStr(DBLKCBDestino.EditValue));
      dm.QryScript.AddWhere('  TABELA_ORIGEM = '+QuotedStr(DBLKCBOrigem.EditValue));
      dm.QryScript.Open;
      dm.QrySubstView.open;
    end;
  except
    Result := false;
    raise;
  end;


end;

procedure TGeradorScript.AbrirProjeto1Click(Sender: TObject);
begin
  if OpenDialog1.Execute(0) then
  begin
    AbreArquivoprojeot(OpenDialog1.FileName);
  end;

end;

procedure TGeradorScript.AbreArquivoprojeot(projeto:string;criaprojeto:boolean=false);
begin
  try
    dm.CcnParametros.close;
    dm.CcnParametros.LoginPrompt := false;
    dm.CcnParametros.ConnectString := 'Provider Name=SQLite;Direct=True;Database='+projeto+';Force Create Database=True;Use Unicode=True;Login Prompt=False';
    StatusBar1.Panels[0].Text :=  'Base do projeoto :'+projeto;
    dm.CcnParametros.Open;
    if criaprojeto then
      dm.Scriptparametro.Execute;
    Fpahtexe := ExtractFilePath(ParamStr(0));
    Flocal := ExtractFilePath(projeto);
    FProjeto := ChangeFileExt(ExtractFileName(projeto),'');

    DM.QryProjeto.Close;
    DM.QryProjeto.Connection := dm.CcnParametros;
    DM.QryProjeto.RestoreSQL;
    DM.QryProjeto.DeleteWhere;
    DM.QryProjeto.AddWhere('PROJETO_NOME ='+QUOTEDSTR(FProjeto));
    DM.QryProjeto.Open;




    FPRJID:=  DM.QryProjetoID.Value;

    DM.QryPersonalQuery.Close;
    DM.QryPersonalQuery.Connection := dm.CcnParametros;
    DM.QryPersonalQuery.RestoreSQL;
    DM.QryPersonalQuery.DeleteWhere;
    DM.QryPersonalQuery.AddWhere('ID_PROJETO ='+INTTOSTR(FPRJID));
    DM.QryPersonalQuery.Open;

    DM.QryScript.Close;
    DM.QryScript.Connection := dm.CcnParametros;
    DM.QryScript.RestoreSQL;
    DM.QryScript.DeleteWhere;
    DM.QryScript.AddWhere('ID_PROJETO ='+INTTOSTR(FPRJID));
    dm.QryScript.Open;

    {
    dm.QryParametros.Close;
    dm.QryParametros.RestoreSQL;
    dm.QryParametros.DeleteWhere;
    dm.QryParametros.AddWhere(' CV.ID_PROJETO = '+INTTOSTR(FPRJID));
    //dm.QryParametros.AddWhere(' TABELA_DESTINO = '+QuotedStr(DBLKCBDestino.EditValue));
    //dm.QryParametros.AddWhere('  TABELA_ORIGEM = '+QuotedStr(DBLKCBOrigem.EditValue));
    dm.QryParametros.Open;
    dm.QryParametros.Last;
    cbSistema.EditValue :=  dm.QryParametrosSISTEMA.AsString;
    dm.QryParametros.CLOSE;
    }

    IniciaConexao;
    if DM.QryProjeto.IsEmpty then
    begin
      dm.QryProjeto.Append;
      FPRJID :=   Round(random(99999));
      dm.QryProjetoID.Value               := FPRJID;
      dm.QryProjetoPROJETO_NOME.Value     := FProjeto;
      dm.QryProjetoCONEXAO_ORIGEM.Value   := dm.CcnOrigem.ConnectString;
      dm.QryProjetoCONEXAO_DESTINO.Value  := dm.CcnDestino.ConnectString;
      dm.QryProjetoDATA_PROJETO.Value     := NOW;
      TfrmProjeto.Abreiniciaprojeot;
      dm.QryProjeto.Post;
      dm.QryProjeto.ApplyUpdates();
    end;
   if abrirFilhos then
   begin
     gravarecente(projeto);
     gerabakcupdb;
     TbShmodelar.TabVisible := true;
     cxTabSheet2.TabVisible := true;
     cxTabSheet5.TabVisible := true;
     EdiotordeConsultasSql1.Enabled := true;
   end;


  except
    raise;

  end;
end;


procedure TGeradorScript.DeletaAssociacaoGeral(origem,destino:string);
var
vwhere :string;
begin
  vwhere := ' Where TABELA_DESTINO =' + QUOTEDSTR(destino)+' and  TABELA_ORIGEM ='+ QUOTEDSTR(origem);
  dm.Executasql('delete from PERSONALFIELDS '+vwhere,cgParametro);
  dm.Executasql('delete from PERSONALWHERES '+vwhere,cgParametro);
  dm.Executasql('delete from SUBSTQUERIES '+vwhere,cgParametro);
  dm.Executasql('delete from CONVERSAO '+vwhere,cgParametro);
  gerabakcupdb;

end;



procedure TGeradorScript.DeletaAssociacao;
  var
    trd : ObjTdc;
begin
  trd := dm.StartTransaction(cgParametro);
  try
    dm.CcnParametros.ExecSQL(' delete from PERSONALFIELDS where '+#13+
                             '    TABELA_DESTINO =' + QUOTEDSTR(dm.QryParametrosTABELA_DESTINO.AsString)+#13+
                             ' and TABELA_ORIGEM =' + QUOTEDSTR(dm.QryParametrosTABELA_ORIGEM.AsString)+#13+
                             ' and PERSONAL_CAMPO =' + QUOTEDSTR(dm.QryParametrosCAMPO_ORIGEM.AsString));

    dm.CcnParametros.ExecSQL(' delete from PERSONALWHERES where '+#13+
                             '     TABELA_DESTINO =' + QUOTEDSTR(dm.QryParametrosTABELA_DESTINO.AsString)+#13+
                             ' and TABELA_ORIGEM =' + QUOTEDSTR(dm.QryParametrosTABELA_ORIGEM.AsString)+#13+
                             ' and CAMPO_WHERE =' + QUOTEDSTR(dm.QryParametrosCAMPO_ORIGEM.AsString));

    dm.CcnParametros.ExecSQL(' delete from SUBSTQUERIES where '+#13+
                             'ID_CONVERSAO =' + dm.QryParametrosID.AsString);

    dm.QryParametros.Delete;
    dm.QryParametros.ApplyUpdates;
    dm.Commit(trd);
  except
    dm.Roolback(trd);
  end;
  gerabakcupdb;
  abrirFilhos;
end;

function TGeradorScript.MsgPerguntaOkCacel(msg:string;caption:string='P'):boolean;
begin
  if caption = 'P' then
    caption := Application.Title;
  result:= Application.MessageBox(pchar(msg), PWideChar(caption), MB_OKCANCEL + MB_ICONQUESTION+MB_TASKMODAL) = IDOK;
end;

procedure TGeradorScript.MsgErro(msg:string;caption:string='P');
begin
  if caption = 'P' then
    caption := Application.Title;
  Application.MessageBox(pchar(msg), PWideChar(caption), MB_OK + MB_ICONERROR+MB_TASKMODAL);
end;

procedure TGeradorScript.MsgAlerta(msg:string;caption:string='P');
begin
  if caption = 'P' then
    caption := Application.Title;
  Application.MessageBox(pchar(msg), PWideChar(caption), MB_OK + MB_ICONWARNING+MB_TASKMODAL);
end;

procedure TGeradorScript.MsgAviso(msg:string;caption:string='P');
begin
  if caption = 'P' then
    caption := Application.Title;
  Application.MessageBox(pchar(msg), PWideChar(caption), MB_OK + MB_ICONEXCLAMATION+MB_TASKMODAL);
end;


procedure TGeradorScript.atualizastatus(sts:string);
begin
  //lbstatus.repaint;
 // lbstatus.caption := sts;
 // lbstatus.repaint;
  application.ProcessMessages;
  Update;
end;

function TGeradorScript.formatadatatimesql(adt:Tdatetime):string;
var
A,
M,
D : word;
begin
  DecodeDate(adt,A,M,D);
 if (A <= 1900) then
    result:= 'Null'
 else
  result:= quotedstr(formatdatetime('yyyy-mm-dd HH:nn:ss',adt));
  if result = quotedstr('') then Result := 'Null';
end;

function TGeradorScript.StrRetnull(val:string):string;
begin
  if (val = '') OR (val = '0') then
    Result := 'Null'
  else
    Result := val;
end;

function TGeradorScript.retnull(adt:string):string;
begin
  if (adt = '') OR (adt = '0') then
    Result := 'Null'
  else
    Result := adt;
end;

function TGeradorScript.tratadouble(doub:double):string;
var
  valor :string;
begin
  try
      valor := formatfloat('##0.00',doub);
    if valor = '' then
      result:= '0'
    else
      result:= ReplaceStr(valor,',','.');
  except
     result:= '0'
  end;
end;

function TGeradorScript.tratadoubleD(doub:double):double;
var
  valor :string;
begin
  try
    valor := formatfloat('##0.00',doub);
    if valor = '' then
      result:= 0.00
    else
      result:= strtofloat(trim(valor));
  except
    result:= 0
  end;
end;

function TGeradorScript.Retsqlboll(vst:string):string;
begin
  if length(vst) = 0 then
    result:= 'null'
  else
    result := quotedstr(vst);
end;

function TGeradorScript.Retsqlstr(vst:string;vclsp:Tinfofield):string;
begin
  if length(vst) = 0 then
    result:= 'null'
  else
  begin

   // if (vclsp.FSizeDst + vclsp.SizeOrg) > 0 then
   // Begin
     // if vclsp.SizeDst < vclsp.SizeOrg then
      //  vst := copy(vst,1,vclsp.SizeDst);
   // End;
    result := quotedstr(vst);
  end;
end;

procedure TGeradorScript.whererotina(idx:integer);
var
  vcampocompara,
  vcampoid :string;
  const
    rotina :array [0..1] of string  = ('exists (select %s from %s WHERE 1 = 1',
    'not exists (select %s from %s WHERE 1 = 1');
    condic :string = 'AND %s = %s';
begin
  MmWhere.Lines.Clear;
  vcampocompara := ifthen(CDSDestinoidxcampo.value = -1,CDSOrigemnome.AsString,CDSDestinonome.AsString);
  vcampoid      := copy(CDSDestinoTabela.AsString,pos('_',CDSDestinoTabela.AsString)+1,length(CDSDestinoTabela.AsString))+'_ID';
  if RGWhere.ItemIndex >= 0 then
    MmWhere.Lines.Text := format(rotina[idx],[vcampoid,CDSDestinoTabela.AsString]);

  edtOper.Text := 'AND';
  EdtCampo.Text := vcampocompara;
  edtcomp.Text := '=';
  edtValor.Text := CDSOrigemnome.AsString;

 // memocondicao.Lines.Text := format(condic,[vcampocompara,CDSOrigemnome.AsString]);
end;

procedure TGeradorScript.RGWherePropertiesChange(Sender: TObject);
begin
  whererotina(RGWhere.ItemIndex);
end;

function TGeradorScript.Retsqldouble(vst:string):string;
var
  valor :string;
begin
  try
    valor := FilterChars(vst,['0'..'9','.',',']);
    if valor = '' then
      result:= 'null'
    else
      result:= ReplaceStr(valor,',','.');
  except
    result:= 'null';
  end;
end;

function TGeradorScript.validadatahora(vst:string;Vclsp : Tinfofield):boolean;
var
  vald :Tdatetime;
  A,M,D, H,MI,S, z : word;
begin
  z := 0;
  try
    vald := StrToDateTime(vst);
    DecodeDate(vald,A,M,D);
    if A <= 1900 then
    begin
      result:= false;
      exit;
    end;

    case Vclsp.TipoDst of
      ftDate :
      begin
        DecodeDate(vald,A,M,D);
        Result:= IsValidDate(A,M,D);
      end;
      ftDateTime, ftTimeStamp :
      begin
        DecodeDateTime(vald,A,M,D,H,MI,S,z);
        Result:= IsValidDateTime(A,M,D,H,MI,S,z);
      end;
      ftTime :
      begin
        DecodeTime(vald,H,MI,S,z);
        Result:= IsValidTime(H,MI,S,z);
      end;
    end;


  except
    Result:= false;
  end;
end;

function TGeradorScript.Retsqldatetime(vst:string;Vclsp : Tinfofield):string;
var
  vald :Tdatetime;
  A,M,D : word;
begin
  try
    vald := StrToDateTime(vst);
    DecodeDate(vald,A,M,D);
    if A <= 1900 then
    begin
      result:= 'null';
      exit;
    end;
    case Vclsp.TipoDst of
       ftDate : result:= ' CAST('+  QuotedStr(FormatDateTime('YYYY/MM/DD', vald)) + ' AS date) ';
       ftTime : result:= ' CAST('+  QuotedStr(FormatDateTime('HH:NN', vald)) + ' AS Time) ';
       ftDateTime, ftTimeStamp : result:= ' CAST(' +  QuotedStr(FormatDateTime('YYYY/MM/DD', vald)) + ' AS TIMESTAMP) ';
    end;
  except
    result:= 'null';
  end;
end;

function TGeradorScript.RetiraEnter(aText : string): string;
begin
  { Retirando as quebras de linha em campos blob }
  Result := StringReplace(aText, #$D#$A, '', [rfReplaceAll]);

  { Retirando as quebras de linha em campos blob }
  Result := StringReplace(Result, #13#10, '', [rfReplaceAll]);
end;

function TGeradorScript.Retsqlint(vst:string):string;
var
  valor :string;
begin
  try
    valor := FilterChars(vst,['0'..'9']);
    if valor = '' then
      result:= 'null'
    else
      result:= valor;
  except
    result:= 'null';
  end;
end;

function  TGeradorScript.retSequencia(seqnome:string):string;
begin
  result:= '(SELECT SEQUENCIA FROM G_SP_SEQUENCIAS('+quotedstr(seqnome)+')';
end;

{$endregion}

{ Tinfofield }

procedure Tinfofield.Resetavalores;
begin
  FSizeOrg := -1;
  FSizeDst := -1;
  FTipoOrg := ftUnknown;
  FTipoDst := ftUnknown;
  FValOrg  := null;
  FValDst  := null;
  FCampoOrigem := '';
  FCampoDestino := '';
  FRotinasql := '';
  FMaiusculo := false;
  FRAcentos := false;
  FFiltro:= -1;
  FPersSelect := '';
  FWhereCheck := '';
  FValorPK :=-1;
  FRotinasql_prm := '';
  FCampoDefault:= false;
  FChvPrimariaOrg := '';
  FChvPrimariaDes := '';
  FValorDefaultCampo := '';
  FCamposSomar := '';
  FOrigemSub := '';
  FRotinasql_prm := '';
  FValorPK := 0;
  FIdCombinacao := 0;
  FTabelaDestino := '';
  FRowNumero := 0;

end;

end.
