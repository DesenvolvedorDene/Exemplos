unit untDatamodule;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,  DBAccess, Uni, SQLiteUniProvider, MemDS, UniProvider,
  SQLServerUniProvider, DALoader, UniLoader, InterBaseUniProvider, UniDacVcl, Datasnap.DBClient, cxEdit,
  cxEditRepositoryItems, cxClasses, Datasnap.Provider, DAScript, UniScript,Dialogs,
  PostgreSQLUniProvider, OracleUniProvider, MongoDBUniProvider, MySQLUniProvider,
  DBFUniProvider, DB2UniProvider, ASEUniProvider, AdvantageUniProvider, ODBCUniProvider, AccessUniProvider,
  DASQLMonitor, UniSQLMonitor,strutils, Data.DB,Vcl.Controls, Vcl.Forms, RedshiftUniProvider;

type
  TConectGet = (cgOrigem,cgDestino,cgParametro);
  ObjTdc = TDATransaction;
  TDM = class(TDataModule)
    CcnOrigem: TUniConnection;
    LdColum: TUniLoader;
    SQLServerUniProvider1: TSQLServerUniProvider;
    MDOrigem: TUniMetaData;
    DSmdOrigem: TUniDataSource;
    CcnDestino: TUniConnection;
    LdDestino: TUniLoader;
    MDDestino: TUniMetaData;
    DSmdDestino: TUniDataSource;
    CcnParametros: TUniConnection;
    SQLiteParamprvd: TSQLiteUniProvider;
    QryParametros: TUniQuery;
    QryProjeto: TUniQuery;
    DSParametro: TUniDataSource;
    InterBaseUniProvider1: TInterBaseUniProvider;
    QryParametrosID: TIntegerField;
    QryParametrosTABELA_ORIGEM: TWideStringField;
    QryParametrosTABELA_DESTINO: TWideStringField;
    QryParametrosCAMPO_ORIGEM: TWideStringField;
    QryParametrosTIPODADO_ORIGEM: TWideStringField;
    QryParametrosTIPODADO_DESTINO: TWideStringField;
    QryParametrosVALOR_ORIGEM: TWideMemoField;
    QryParametrosVALOR_DESTINO: TWideMemoField;
    QryParametrosTAM_CAMPO_ORIGEM: TIntegerField;
    QryParametrosTAM_CAMPO_DESTINO: TIntegerField;
    CDOrigem: TUniConnectDialog;
    CDSTabelas: TClientDataSet;
    CDSTabelasidx: TAutoIncField;
    CDSTabelasTabelaOrigem: TStringField;
    CDSTabelasTabelaDestino: TStringField;
    DSTabelas: TDataSource;
    cxEditRepository1: TcxEditRepository;
    cxEditRepositoryCbCamposOrigem: TcxEditRepositoryComboBoxItem;
    MDField: TUniMetaData;
    DSOrigemField: TUniDataSource;
    CDSOrigemField: TClientDataSet;
    CDSOrigemFieldTABLE_CATALOG: TStringField;
    CDSOrigemFieldTABLE_SCHEMA: TStringField;
    CDSOrigemFieldTABLE_NAME: TStringField;
    CDSOrigemFieldCOLUMN_NAME: TStringField;
    CDSOrigemFieldPOSITION: TIntegerField;
    CDSOrigemFieldDATA_TYPE: TIntegerField;
    CDSOrigemFieldDATA_LENGTH: TIntegerField;
    CDSOrigemFieldDATA_PRECISION: TIntegerField;
    CDSOrigemFieldDATA_SCALE: TIntegerField;
    CDSOrigemFieldNULLABLE: TIntegerField;
    CDSOrigemFieldDEFAULT_VALUE: TMemoField;
    QryParametrosBANCO_ORIGEM: TWideStringField;
    QryParametrosBANCO_DESTINO: TWideStringField;
    QryParametrosCAMPO_DESTINO: TWideStringField;
    Scriptparametro: TUniScript;
    QryProjetoID: TIntegerField;
    QryProjetoPROJETO_NOME: TWideStringField;
    QryProjetoCONEXAO_ORIGEM: TWideStringField;
    QryProjetoCONEXAO_DESTINO: TWideStringField;
    QryProjetoDATA_PROJETO: TDateField;
    DSProjeto: TUniDataSource;
    QrySelect: TUniQuery;
    QryExecuteparam: TUniQuery;
    QryExecuteparamTABELA_ORIGEM: TWideStringField;
    QryExecuteparamTABELA_DESTINO: TWideStringField;
    QryParamins: TUniQuery;
    QryParaminsID: TIntegerField;
    QryParaminsTABELA_ORIGEM: TWideStringField;
    QryParaminsTABELA_DESTINO: TWideStringField;
    QryParaminsCAMPO_ORIGEM: TWideStringField;
    QryParaminsTIPODADO_ORIGEM: TWideStringField;
    QryParaminsTIPODADO_DESTINO: TWideStringField;
    QryParaminsVALOR_ORIGEM: TWideMemoField;
    QryParaminsVALOR_DESTINO: TWideMemoField;
    QryParaminsTAM_CAMPO_ORIGEM: TIntegerField;
    QryParaminsTAM_CAMPO_DESTINO: TIntegerField;
    QryParaminsBANCO_ORIGEM: TWideStringField;
    QryParaminsBANCO_DESTINO: TWideStringField;
    QryParaminsCAMPO_DESTINO: TWideStringField;
    DSPTVOrigem: TDataSetProvider;
    QryParaminsSISTEMA: TWideStringField;
    QryParametrosSISTEMA: TWideStringField;
    QryProjetoRESPONSAVEL_NOME: TWideStringField;
    QryProjetoCLIENTE_NOME: TWideStringField;
    QryExecuteparamSISTEMA: TWideStringField;
    QryPersonalQuery: TUniQuery;
    QryPersonalQueryID: TIntegerField;
    QryPersonalQueryID_PROJETO: TIntegerField;
    QryPersonalQueryQRY_NOME: TWideStringField;
    QryPersonalQueryQRY_TEXT: TWideMemoField;
    QryPersonalQueryQRY_OBS: TWideMemoField;
    DSPersonalQuery: TUniDataSource;
    ScriptTeste: TUniScript;
    CDSTVOrigemTABLE_CATALOG: TStringField;
    CDSTVOrigemTABLE_SCHEMA: TStringField;
    CDSTVOrigemTABLE_NAME: TStringField;
    CDSTVOrigemTABLE_TYPE: TStringField;
    CDSTVOrigem: TClientDataSet;
    QryPersonalQuerySISTEMA: TWideStringField;
    MDOCDSOrige: TClientDataSet;
    QrySelectPrj: TUniQuery;
    QrySubstQueries: TUniQuery;
    QrySubstQueriesID: TIntegerField;
    QrySubstQueriesID_CONVERSAO: TIntegerField;
    QrySubstQueriesVALOR_ORIGEM: TWideStringField;
    QrySubstQueriesVALOR_DESTINO: TWideStringField;
    QryParaminsID_PROJETO: TIntegerField;
    QryParaminsSISTEMAID: TIntegerField;
    QryParaminsACEITA_NULL: TBooleanField;
    QryParaminsGERAR_VALOR: TBooleanField;
    QryParaminsTIPOVALOR_GERAR: TIntegerField;
    QryParaminsVALOR_A_CONSIDERAR: TIntegerField;
    QryParametrosID_PROJETO: TIntegerField;
    QryParametrosSISTEMAID: TIntegerField;
    QryParametrosACEITA_NULL: TBooleanField;
    QryParametrosGERAR_VALOR: TBooleanField;
    QryParametrosTIPOVALOR_GERAR: TIntegerField;
    QryParametrosVALOR_A_CONSIDERAR: TIntegerField;
    DSQryParametros: TUniDataSource;
    QrySubstQueriesins: TUniQuery;
    DSQryParamins: TUniDataSource;
    QrySubstQueriesinsID: TIntegerField;
    QrySubstQueriesinsID_CONVERSAO: TIntegerField;
    QrySubstQueriesinsVALOR_ORIGEM: TWideStringField;
    QrySubstQueriesinsVALOR_DESTINO: TWideStringField;
    QryPersQueryExec: TUniQuery;
    QryPersQueryExecID: TIntegerField;
    QryPersQueryExecID_PROJETO: TIntegerField;
    QryPersQueryExecQRY_NOME: TWideStringField;
    QryPersQueryExecQRY_TEXT: TWideMemoField;
    QryPersQueryExecQRY_OBS: TWideMemoField;
    QryPersQueryExecSISTEMA: TWideStringField;
    AccessUniProvider1: TAccessUniProvider;
    AdvantageUniProvider1: TAdvantageUniProvider;
    ASEUniProvider1: TASEUniProvider;
    DB2UniProvider1: TDB2UniProvider;
    DBFUniProvider1: TDBFUniProvider;
    MySQLUniProvider1: TMySQLUniProvider;
    MongoDBUniProvider1: TMongoDBUniProvider;
    ODBCUniProvider1: TODBCUniProvider;
    OracleUniProvider1: TOracleUniProvider;
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    RedshiftUniProvider1: TRedshiftUniProvider;
    QryParametrosIDX_CAMPO_ORIGEM: TIntegerField;
    QryParaminsIDX_CAMPO_ORIGEM: TIntegerField;
    CDlgDestino: TUniConnectDialog;
    QrySubstQueriesinsROTINA_SQL: TWideMemoField;
    QrySubstQueriesROTINA_SQL: TWideMemoField;
    QryParaminsIDX_CAMPO_DESTINO: TIntegerField;
    QryParametrosIDX_CAMPO_DESTINO: TIntegerField;
    UniSQLMonitor1: TUniSQLMonitor;
    QryParametrosPERSONAL_SELECT: TWideMemoField;
    QryParaminsPERSONAL_SELECT: TWideMemoField;
    QryEditor: TUniQuery;
    DSEditor: TUniDataSource;
    QryPersonalFields: TUniQuery;
    QryPersonalFieldsID: TIntegerField;
    QryPersonalFieldsID_PROJETO: TIntegerField;
    QryPersonalFieldsTABELA_DESTINO: TWideStringField;
    QryPersonalFieldsROTINA_SQL: TWideStringField;
    QryParametrosUSAR_COMO_WHERE: TBooleanField;
    QryParaminsUSAR_COMO_WHERE: TBooleanField;
    QryPERSONALWHERES: TUniQuery;
    QryPERSONALWHERESID: TIntegerField;
    QryPERSONALWHERESID_PROJETO: TIntegerField;
    QryPERSONALWHERESTABELA_DESTINO: TWideStringField;
    QryPERSONALWHERESROTINA_SQL: TWideStringField;
    QryScript: TUniQuery;
    QryScriptID: TIntegerField;
    QryScriptID_PROJETO: TIntegerField;
    QryScriptTIPO_SCRIPT: TWideStringField;
    QryScriptSCRIPT: TWideMemoField;
    QryScriptSCRIPT_ARQ: TBlobField;
    QryScriptDATA_INSERT: TDateTimeField;
    QryScriptRESPONSAVEL_NOME: TWideStringField;
    QryParametrosCARACTERES_REMOVER: TWideStringField;
    QryParaminsCARACTERES_REMOVER: TWideStringField;
    DS_Script: TUniDataSource;
    QryPERSONALWHERESCAMPO_WHERE: TWideStringField;
    QryPERSONALWHERESTIPO_CAMPOWHR: TWideStringField;
    QryPersonalFieldsPERSONAL_CAMPO: TWideStringField;
    QryPersonalFieldsTIPO_CAMPO: TWideStringField;
    QrySubstQueriesCAMPO: TWideStringField;
    QrySubstQueriesTIPO_CAMPO: TWideStringField;
    QrySubstQueriesinsCAMPO: TWideStringField;
    QrySubstQueriesinsTIPO_CAMPO: TWideStringField;
    QryPERSONALWHERESTABELA_ORIGEM: TWideStringField;
    QryPersonalFieldsTABELA_ORIGEM: TWideStringField;
    QrySubstQueriesTABELA_DESTINO: TWideStringField;
    QrySubstQueriesTABELA_ORIGEM: TWideStringField;
    QryScriptTABELA_DESTINO: TWideStringField;
    QryScriptTABELA_ORIGEM: TWideStringField;
    SP_SEQUENCIA: TUniStoredProc;
    SP_SEQUENCIASEQUENCIA: TFloatField;
    QryRelationship: TUniQuery;
    QryRelationshipTABNOME: TStringField;
    QryRelationshipPRIMARYKEYNAME: TStringField;
    MDColunas: TUniMetaData;
    DataSource1: TDataSource;
    QryPersonalQueryLoad: TUniQuery;
    QryPersonalQueryLoadID: TIntegerField;
    QryPersonalQueryLoadID_PROJETO: TIntegerField;
    QryPersonalQueryLoadQRY_NOME: TWideStringField;
    QryPersonalQueryLoadQRY_TEXT: TWideMemoField;
    QryPersonalQueryLoadQRY_OBS: TWideMemoField;
    QryPersonalQueryLoadSISTEMA: TWideStringField;
    QryScriptLookup1: TUniQuery;
    DSScriptLookup: TDataSource;
    QryConvGera1: TUniQuery;
    DSConvGera: TUniDataSource;
    QryConvGera1SELECAOT: TWideMemoField;
    QryConvGera1TABELA_ORIGEM: TWideMemoField;
    QryConvGera1TABELA_DESTINO: TWideMemoField;
    QryConvGera1TODAS: TLargeintField;
    QryScriptLookup1ID: TLargeintField;
    QryScriptLookup1ID_PROJETO: TLargeintField;
    QryScriptLookup1TABELA_DESTINO: TWideMemoField;
    QryScriptLookup1TABELA_ORIGEM: TWideMemoField;
    QryScriptLookup1TIPO_SCRIPT: TWideMemoField;
    QryScriptLookup1SCRIPT: TWideMemoField;
    QryScriptLookup1SCRIPT_ARQ: TWideMemoField;
    QryScriptLookup1DATA_INSERT: TWideMemoField;
    QryScriptLookup1RESPONSAVEL_NOME: TWideMemoField;
    QryScriptLookup1TODAS: TLargeintField;
    QryConvGera1ID: TLargeintField;
    QryParametros_SQL: TWideStringField;
    Qry_ScriptArq: TUniQuery;
    DS_ScriptArq: TUniDataSource;
    Qry_ScriptArqID: TIntegerField;
    Qry_ScriptArqID_PROJETO: TIntegerField;
    Qry_ScriptArqTIPO_SCRIPT: TWideStringField;
    Qry_ScriptArqSCRIPT: TWideMemoField;
    Qry_ScriptArqSCRIPT_ARQ: TBlobField;
    Qry_ScriptArqDATA_INSERT: TDateTimeField;
    Qry_ScriptArqRESPONSAVEL_NOME: TWideStringField;
    Qry_ScriptArqTABELA_DESTINO: TWideStringField;
    Qry_ScriptArqTABELA_ORIGEM: TWideStringField;
    Qry_ScriptArqNOME_ARQUIVO: TWideStringField;
    QryScriptNOME_ARQUIVO: TWideStringField;
    MDOCDSOrigeTABLE_CATALOG: TStringField;
    MDOCDSOrigeTABLE_SCHEMA: TStringField;
    MDOCDSOrigeTABLE_NAME: TStringField;
    MDOCDSOrigeTABLE_TYPE: TStringField;
    QrySubstQueriesinsTABELA_DESTINO: TWideStringField;
    QrySubstQueriesinsTABELA_ORIGEM: TWideStringField;
    QryMontaPrSelect: TUniQuery;
    QryPERSONALWHERESSE_EXISTE: TWideStringField;
    DSPERSONALWHERES: TUniDataSource;
    QryPERSONALWHERESselectgeral: TWideMemoField;
    QryParaminsRETIRAR_ACENTOS: TBooleanField;
    QryParaminsCONVETER_MAIUSCULO: TBooleanField;
    QryParametrosRETIRAR_ACENTOS: TBooleanField;
    QryParametrosCONVETER_MAIUSCULO: TBooleanField;
    QryParametrosFILTRAR_CARACTERES: TIntegerField;
    QryParaminsFILTRAR_CARACTERES: TIntegerField;
    QrySelectTable: TUniQuery;
    QryInsertTable: TUniQuery;
    DSPersonalFields: TUniDataSource;
    QryGeral: TUniQuery;
    QryGeralExec: TUniQuery;
    QryParamWhr: TUniQuery;
    QryParamWhrID: TIntegerField;
    QryParamWhrTABELA_ORIGEM: TWideStringField;
    QryParamWhrTABELA_DESTINO: TWideStringField;
    QryParamWhrCAMPO_ORIGEM: TWideStringField;
    QryParamWhrTIPODADO_ORIGEM: TWideStringField;
    QryParamWhrTIPODADO_DESTINO: TWideStringField;
    QryParamWhrVALOR_ORIGEM: TWideMemoField;
    QryParamWhrVALOR_DESTINO: TWideMemoField;
    QryParamWhrTAM_CAMPO_ORIGEM: TIntegerField;
    QryParamWhrTAM_CAMPO_DESTINO: TIntegerField;
    QryParamWhrBANCO_ORIGEM: TWideStringField;
    QryParamWhrBANCO_DESTINO: TWideStringField;
    QryParamWhrCAMPO_DESTINO: TWideStringField;
    QryParamWhrSISTEMA: TWideStringField;
    QryParamWhrID_PROJETO: TIntegerField;
    QryParamWhrSISTEMAID: TIntegerField;
    QryParamWhrACEITA_NULL: TBooleanField;
    QryParamWhrGERAR_VALOR: TBooleanField;
    QryParamWhrTIPOVALOR_GERAR: TIntegerField;
    QryParamWhrVALOR_A_CONSIDERAR: TIntegerField;
    QryParamWhrIDX_CAMPO_ORIGEM: TIntegerField;
    QryParamWhrIDX_CAMPO_DESTINO: TIntegerField;
    QryParamWhrPERSONAL_SELECT: TWideMemoField;
    QryParamWhrUSAR_COMO_WHERE: TBooleanField;
    QryParamWhrCARACTERES_REMOVER: TWideStringField;
    QryParamWhrRETIRAR_ACENTOS: TBooleanField;
    QryParamWhrCONVETER_MAIUSCULO: TBooleanField;
    QryParamWhrFILTRAR_CARACTERES: TIntegerField;
    QryParaminsAJUSTAR_TAMANHO: TBooleanField;
    QryParametrosAJUSTAR_TAMANHO: TBooleanField;
    QryParamWhrAJUSTAR_TAMANHO: TBooleanField;
    TblInsert3: TUniTable;
    QryParametrosCHAVE_PRIMARIA_DESTINO: TWideStringField;
    QryParaminsCHAVE_PRIMARIA_DESTINO: TWideStringField;
    QryParamWhrCHAVE_PRIMARIA_DESTINO: TWideStringField;
    QryExecuteparamCHAVE_PRIMARIA_DESTINO: TWideStringField;
    UniScript1: TUniScript;
    QryOrdena: TUniQuery;
    DSOrdena: TUniDataSource;
    QryParametrosORDEM_EXEC: TIntegerField;
    QryParaminsORDEM_EXEC: TIntegerField;
    QryOrdenaTABELA_ORIGEM: TWideStringField;
    QryOrdenaTABELA_DESTINO: TWideStringField;
    QryOrdenaMARCADO: TLargeintField;
    QryOrdenaORDEM_EXEC: TLargeintField;
    QryExecuteparamMARCADO: TLargeintField;
    DSExecuteparam: TUniDataSource;
    QryParametrosPERS_SELECT_WHERE: TWideMemoField;
    QryParametrosSEQUENCIA: TWideStringField;
    QryParaminsPERS_SELECT_WHERE: TWideMemoField;
    QryParaminsSEQUENCIA: TWideStringField;
    QryParamWhrPERS_SELECT_WHERE: TWideMemoField;
    QryParamWhrORDEM_EXEC: TIntegerField;
    QryParamWhrSEQUENCIA: TWideStringField;
    QryChecaSeq: TUniQuery;
    QryChecaSeqSEQUENCIA: TWideStringField;
    QryChecaSeqGERAR_VALOR: TBooleanField;
    QryChecaSeqTIPOVALOR_GERAR: TIntegerField;
    QryChecaSeqVALOR_A_CONSIDERAR: TIntegerField;
    QryParams: TUniQuery;
    Qryconvfield: TUniQuery;
    QryconvfieldID: TIntegerField;
    QryconvfieldTABELA_ORIGEM: TWideStringField;
    QryconvfieldTABELA_DESTINO: TWideStringField;
    QryconvfieldCAMPO_ORIGEM: TWideStringField;
    QryconvfieldTIPODADO_ORIGEM: TWideStringField;
    QryconvfieldTIPODADO_DESTINO: TWideStringField;
    QryconvfieldVALOR_ORIGEM: TWideMemoField;
    QryconvfieldVALOR_DESTINO: TWideMemoField;
    QryconvfieldTAM_CAMPO_ORIGEM: TIntegerField;
    QryconvfieldTAM_CAMPO_DESTINO: TIntegerField;
    QryconvfieldBANCO_ORIGEM: TWideStringField;
    QryconvfieldBANCO_DESTINO: TWideStringField;
    QryconvfieldCAMPO_DESTINO: TWideStringField;
    QryconvfieldSISTEMA: TWideStringField;
    QryconvfieldID_PROJETO: TIntegerField;
    QryconvfieldSISTEMAID: TIntegerField;
    QryconvfieldACEITA_NULL: TBooleanField;
    QryconvfieldGERAR_VALOR: TBooleanField;
    QryconvfieldTIPOVALOR_GERAR: TIntegerField;
    QryconvfieldVALOR_A_CONSIDERAR: TIntegerField;
    QryconvfieldIDX_CAMPO_ORIGEM: TIntegerField;
    QryconvfieldIDX_CAMPO_DESTINO: TIntegerField;
    QryconvfieldPERSONAL_SELECT: TWideMemoField;
    QryconvfieldUSAR_COMO_WHERE: TBooleanField;
    QryconvfieldCARACTERES_REMOVER: TWideStringField;
    QryconvfieldRETIRAR_ACENTOS: TBooleanField;
    QryconvfieldCONVETER_MAIUSCULO: TBooleanField;
    QryconvfieldFILTRAR_CARACTERES: TIntegerField;
    QryconvfieldAJUSTAR_TAMANHO: TBooleanField;
    QryconvfieldCHAVE_PRIMARIA_DESTINO: TWideStringField;
    QryconvfieldPERS_SELECT_WHERE: TWideMemoField;
    QryconvfieldORDEM_EXEC: TIntegerField;
    QryconvfieldSEQUENCIA: TWideStringField;
    QryParametrosCHAVE_PRIMARIA_ORIGEM: TWideStringField;
    QryParaminsCHAVE_PRIMARIA_ORIGEM: TWideStringField;
    QryParamWhrCHAVE_PRIMARIA_ORIGEM: TWideStringField;
    QryconvfieldCHAVE_PRIMARIA_ORIGEM: TWideStringField;
    QryParaminsTCAMPO: TWideStringField;
    QryParametrosTCAMPO: TWideStringField;
    QryParamWhrTCAMPO: TWideStringField;
    QryconvfieldTCAMPO: TWideStringField;
    QryPERSONALWHERESConcatselectgeral: TWideMemoField;
    execsql: TUniSQL;
    scrExecute: TUniScript;
    QryExecuteparamORDEM_EXEC: TLargeintField;
    QryExecuteparamsomaordem: TLargeintField;
    QryConvGera1ordemexec: TLargeintField;
    QryParametrosCOMPORCHAVEDEFAULT: TBooleanField;
    QryParamWhrCOMPORCHAVEDEFAULT: TBooleanField;
    QryParaminsCOMPORCHAVEDEFAULT: TBooleanField;
    QryPERSONALWHERESCOMPARACOES: TWideMemoField;
    QryParametroEdit: TUniQuery;
    DSParametroEdit: TUniDataSource;
    QryParametroEditID: TIntegerField;
    QryParametroEditTABELA_ORIGEM: TWideStringField;
    QryParametroEditTABELA_DESTINO: TWideStringField;
    QryParametroEditCAMPO_ORIGEM: TWideStringField;
    QryParametroEditTIPODADO_ORIGEM: TWideStringField;
    QryParametroEditTIPODADO_DESTINO: TWideStringField;
    QryParametroEditVALOR_ORIGEM: TWideMemoField;
    QryParametroEditVALOR_DESTINO: TWideMemoField;
    QryParametroEditTAM_CAMPO_ORIGEM: TIntegerField;
    QryParametroEditTAM_CAMPO_DESTINO: TIntegerField;
    QryParametroEditBANCO_ORIGEM: TWideStringField;
    QryParametroEditBANCO_DESTINO: TWideStringField;
    QryParametroEditCAMPO_DESTINO: TWideStringField;
    QryParametroEditSISTEMA: TWideStringField;
    QryParametroEditID_PROJETO: TIntegerField;
    QryParametroEditSISTEMAID: TIntegerField;
    QryParametroEditACEITA_NULL: TBooleanField;
    QryParametroEditGERAR_VALOR: TBooleanField;
    QryParametroEditTIPOVALOR_GERAR: TIntegerField;
    QryParametroEditVALOR_A_CONSIDERAR: TIntegerField;
    QryParametroEditIDX_CAMPO_ORIGEM: TIntegerField;
    QryParametroEditIDX_CAMPO_DESTINO: TIntegerField;
    QryParametroEditPERSONAL_SELECT: TWideMemoField;
    QryParametroEditUSAR_COMO_WHERE: TBooleanField;
    QryParametroEditCARACTERES_REMOVER: TWideStringField;
    QryParametroEdit_SQL: TWideStringField;
    QryParametroEditRETIRAR_ACENTOS: TBooleanField;
    QryParametroEditCONVETER_MAIUSCULO: TBooleanField;
    QryParametroEditFILTRAR_CARACTERES: TIntegerField;
    QryParametroEditAJUSTAR_TAMANHO: TBooleanField;
    QryParametroEditCHAVE_PRIMARIA_DESTINO: TWideStringField;
    QryParametroEditORDEM_EXEC: TIntegerField;
    QryParametroEditPERS_SELECT_WHERE: TWideMemoField;
    QryParametroEditSEQUENCIA: TWideStringField;
    QryParametroEditCHAVE_PRIMARIA_ORIGEM: TWideStringField;
    QryParametroEditTCAMPO: TWideStringField;
    QryParametroEditCOMPORCHAVEDEFAULT: TBooleanField;
    QryParametrosDEFAULT_VALOR: TWideStringField;
    QryParaminsDEFAULT_VALOR: TWideStringField;
    QryParamWhrDEFAULT_VALOR: TWideStringField;
    QryParametroEditDEFAULT_VALOR: TWideStringField;
    QryconvfieldCOMPORCHAVEDEFAULT: TBooleanField;
    QryconvfieldDEFAULT_VALOR: TWideStringField;
    MdSelector: TUniMetaData;
    DSSubstQueriesins: TUniDataSource;
    QrySubstView: TUniQuery;
    QrySubstViewID: TIntegerField;
    QrySubstViewID_CONVERSAO: TIntegerField;
    QrySubstViewVALOR_ORIGEM: TWideStringField;
    QrySubstViewVALOR_DESTINO: TWideStringField;
    QrySubstViewROTINA_SQL: TWideMemoField;
    QrySubstViewCAMPO: TWideStringField;
    QrySubstViewTIPO_CAMPO: TWideStringField;
    QrySubstViewTABELA_DESTINO: TWideStringField;
    QrySubstViewTABELA_ORIGEM: TWideStringField;
    QrySubstQueriesREFERENTE: TWideStringField;
    QrySubstQueriesinsREFERENTE: TWideStringField;
    QrySubstViewREFERENTE: TWideStringField;
    UniQuery1: TUniQuery;
    QryC_ORDEM: TUniQuery;
    QryC_ORDEMID: TIntegerField;
    QryC_ORDEMTABELA_ORIGEM: TWideStringField;
    QryC_ORDEMTABELA_DESTINO: TWideStringField;
    QryC_ORDEMORDEM_EXEC: TIntegerField;
    QryC_ORDEMID_PROJETO: TIntegerField;
    QryC_ORDEMORIGEM_G_CHAVE: TWideMemoField;
    QryParaminsRTFTOTEXT: TBooleanField;
    QryParametrosRTFTOTEXT: TBooleanField;
    QryParametroEditRTFTOTEXT: TBooleanField;
    QryParamWhrRTFTOTEXT: TBooleanField;
    procedure LdOrigemGetColumnData(Sender: TObject; Column: TDAColumn; Row: Integer; var Value: Variant; var IsEOF: Boolean);
    procedure ScriptTesteError(Sender: TObject; E: Exception; SQL: string; var Action: TErrorAction);
    procedure MDOrigemAfterOpen(DataSet: TDataSet);
    procedure MDOCDSOrigeAfterOpen(DataSet: TDataSet);
    procedure QryGeralExecBeforeExecute(Sender: TObject);
    procedure QryGeralBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private

    Tdc: TDATransaction;
    function GetIndexFieldNamesByIndexName(const AUniConnection: TUniConnection; const AIndexName: String): String;










    { Private declarations }
  public
    { Public declarations }
    function MsgPerguntaSimNao(msg:string;caption:string='P'):boolean;
    procedure Commit(trd:ObjTdc=nil);
    procedure Roolback(trd:ObjTdc=nil);
    Function StartTransaction(vConec: TConectGet= cgDestino) :TDATransaction;
    procedure gravatabelasorigens;
    function GerarSequencia(Tabela: string): Variant;
    function RetornaTexto(Str: String): String;
    function retiraracentos(str: String): String;
    function RetornaTextoEntreChar(vTexto:String; vCaracter:array of Char): String;
    function GetSql(Qry: string;vRetField:string='';vConec:TConectGet= cgDestino): string;
    procedure Executasql(Qry: string;vConec:TConectGet= cgDestino);
    function VerificaExiste(Qry: string; vConec: TConectGet= cgDestino): boolean;
    function Criafieldhashdeful(strCampo: string): boolean;
    procedure executascript(script:string;vConec:TConectGet= cgDestino);
    function GetSqlSelec(Qry: string;vConec:TConectGet= cgDestino;vAbrir:boolean=false): TUniQuery;
  end;

var
  DM: TDM;
  Tipoexec :TConectGet;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses WPRTEDefs, WPCTRMemo, WPCTRRich;


procedure TDM.Commit(trd:ObjTdc=nil);
begin
  if trd = nil then
  begin
    if Tdc.Active then
      Tdc.Commit;
    Tdc.Free;
  end else
  begin
    if trd.Active then
      trd.Commit;
    trd.Free;
  end;

end;

procedure TDM.Roolback(trd:ObjTdc=nil);
begin
  if trd = nil then
  begin
    if Tdc.Active then
      Tdc.Rollback;
    Tdc.Free;
  end else
  begin
    if trd.Active then
      trd.Rollback;
    trd.Free;
  end;
end;

function TDM.MsgPerguntaSimNao(msg:string;caption:string='P'):boolean;
begin
  if caption = 'P' then
    caption := 'Gerador de Converssão';
  result:= Application.MessageBox(PWideChar(msg), PWideChar(caption), MB_YESNO + MB_ICONQUESTION+MB_TASKMODAL) = IDYES;
end;

Function TDM.StartTransaction(vConec: TConectGet= cgDestino):ObjTdc;

begin
  { Verifica se já não está em uma transação }
    case vConec of
      cgOrigem :Tdc:=CcnOrigem.CreateTransaction;
      cgDestino :Tdc:=CcnDestino.CreateTransaction;
      cgParametro :Tdc:=CcnParametros.CreateTransaction;
    end;
    Tdc.StartTransaction;
    Result := Tdc;
end;

function TDM.Criafieldhashdeful(strCampo:string):boolean;
var
 vsqlrotina : string;
  vid: string;
begin
  vid := '';
  vid := inttostr(Round(random(99999)));
  vsqlrotina :=  'INSERT INTO CONVERSAO (																	'+#13+
                 '                          CHAVE_PRIMARIA_ORIGEM,                                           '+#13+
                 '                          SEQUENCIA,                                                       '+#13+
                 '                          ORDEM_EXEC,                                                      '+#13+
                 '                          CHAVE_PRIMARIA_DESTINO,                                          '+#13+
                 '                          AJUSTAR_TAMANHO,                                                 '+#13+
                 '                          FILTRAR_CARACTERES,                                              '+#13+
                 '                          CONVETER_MAIUSCULO,                                              '+#13+
                 '                          RETIRAR_ACENTOS,                                                 '+#13+
                 '                          VALOR_A_CONSIDERAR,                                              '+#13+
                 '                          TIPOVALOR_GERAR,                                                 '+#13+
                 '                          USAR_COMO_WHERE,                                                 '+#13+
                 '                          CARACTERES_REMOVER,                                              '+#13+
                 '                          PERSONAL_SELECT,                                                 '+#13+
                 '                          GERAR_VALOR,                                                     '+#13+
                 '                          ACEITA_NULL,                                                     '+#13+
                 '                          TAM_CAMPO_DESTINO,                                               '+#13+
                 '                          TAM_CAMPO_ORIGEM,                                                '+#13+
                 '                          VALOR_DESTINO,                                                   '+#13+
                 '                          VALOR_ORIGEM,                                                    '+#13+
                 '                          TIPODADO_DESTINO,                                                '+#13+
                 '                          TIPODADO_ORIGEM,                                                 '+#13+
                 '                          CAMPO_DESTINO,                                                   '+#13+
                 '                          CAMPO_ORIGEM,                                                    '+#13+
                 '                          IDX_CAMPO_DESTINO,                                               '+#13+
                 '                          IDX_CAMPO_ORIGEM,                                                '+#13+
                 '                          TABELA_DESTINO,                                                  '+#13+
                 '                          TABELA_ORIGEM,                                                   '+#13+
                 '                          BANCO_DESTINO,                                                   '+#13+
                 '                          BANCO_ORIGEM,                                                    '+#13+
                 '                          SISTEMAID,                                                       '+#13+
                 '                          SISTEMA,                                                         '+#13+
                 '                          ID_PROJETO,                                                      '+#13+
                 '                          ID,                                                              '+#13+
                 '                          TCAMPO                                                            '+#13+
                 '                      )                                                                    '+#13+
                 '                      VALUES (                                                             '+#13+
                 '                          '+quotedstr(QryParaminsCHAVE_PRIMARIA_ORIGEM.AsString)+',                                          '+#13+
                 '                          NULL,                                                            '+#13+
                 '                          4,                                                               '+#13+
                 '                          '+quotedstr(QryParaminsCHAVE_PRIMARIA_DESTINO.AsString)+',                                          '+#13+
                 '                          0,                                                               '+#13+
                 '-                         1,                                                               '+#13+
                 '                          0,                                                               '+#13+
                 '                          0,                                                               '+#13+
                 '                          0,                                                               '+#13+
                 '-                         1,                                                               '+#13+
                 '                          1,                                                               '+#13+
                 '                          NULL,                                                            '+#13+
                 '                          NULL,                                                            '+#13+
                 '                          0,                                                               '+#13+
                 '                          0,                                                               '+#13+
                 '                          1000,                                                            '+#13+
                 '                          1000,                                                            '+#13+
                 '                          NULL,                                                            '+#13+
                 '                          NULL,                                                            '+#13+
                 '                          '+quotedstr('ftString')+',                                                      '+#13+
                 '                          '+quotedstr('ftString')+',                                                      '+#13+
                 '                          '+quotedstr(strCampo)+',                                                       '+#13+
                 '                          '+quotedstr(strCampo)+',                                                       '+#13+
                 '                          1000,                                                            '+#13+
                 '                          1000,                                                             '+#13+
                 '                          '+quotedstr(QryParaminsTABELA_DESTINO.AsString)+',                                                      '+#13+
                 '                          '+quotedstr(QryParaminsTABELA_ORIGEM.AsString)+',                                          '+#13+
                 '                          '+quotedstr(QryParaminsBANCO_DESTINO.AsString)+',                  '+#13+
                 '                          '+quotedstr(QryParaminsBANCO_ORIGEM.AsString)+',  '+#13+
                 '                          12,                                                               '+#13+
                 '                          '+quotedstr(QryParaminsSISTEMA.AsString)+',                                                   '+#13+
                 '                          '+QryParaminsID_PROJETO.AsString+',                                                           '+#13+
                 '                          '+vid +',                                                           '+#13+
                 '                          '+quotedstr('DEF')+'                                              '+#13+
                 '                      );  ';
  Executasql(vsqlrotina,cgParametro);

end;

function TDM.GetSqlSelec(Qry: string;vConec:TConectGet= cgDestino;vAbrir:boolean=false): TUniQuery;
begin
  Result := QryGeral;
  try
    QryGeral.Close;
    case vConec of
      cgOrigem :QryGeral.Connection := CcnOrigem;
      cgDestino :QryGeral.Connection := CcnDestino;
      cgParametro :QryGeral.Connection := CcnParametros;
    end;
    QryGeral.SQL.Clear;
    QryGeral.DeleteWhere;
    QryGeral.SQL.Text := Qry;
    if vAbrir then
    begin
      QryGeral.Open;

    end;
    Result:= QryGeral;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      raise;
    end;
  end;

end;


function TDM.GetSql(Qry: string;vRetField:string='';vConec:TConectGet= cgDestino): string;
begin
  Result := '';
  try
    QryGeral.Close;
    case vConec of
      cgOrigem :QryGeral.Connection := CcnOrigem;
      cgDestino :QryGeral.Connection := CcnDestino;
      cgParametro :QryGeral.Connection := CcnParametros;
    end;
    QryGeral.SQL.Clear;
    QryGeral.DeleteWhere;
    QryGeral.SQL.Text := Qry;
    QryGeral.Open;
    if not QryGeral.IsEmpty then
    begin
      if vRetField <> '' then
        Result := QryGeral.FieldByName(vRetField).AsString
      else
        Result := QryGeral.Fields[0].asstring;
    end;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      raise;
    end;
  end;
  QryGeral.Close;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  CcnOrigem.Database := '';
  CcnOrigem.Server := '';
  CcnOrigem.ConnectString := '';
  CcnOrigem.Server := '';
  CcnDestino.Database := '';
  CcnDestino.ConnectString := '';
  CcnOrigem.Server := '';
  CcnParametros.Database := '';
  CcnParametros.ConnectString := '';

end;

procedure TDM.Executasql(Qry: string;vConec:TConectGet= cgDestino);
begin
  try
    //QryGeralExec.Close;
    case vConec of
      cgOrigem :CcnOrigem.ExecSQL(Qry);   //    := CcnOrigem;
      cgDestino :CcnDestino.ExecSQL(Qry);   //:= CcnDestino;
      cgParametro :CcnParametros.ExecSQL(Qry);   // := CcnParametros;
    end;


  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      raise;
    end;

  end;
  //QryGeralExec.Close;
end;

Function TDM.VerificaExiste(Qry: string;vConec:TConectGet= cgDestino):boolean;
begin
  Result := false;
  if Qry='' then exit;

  try
    QryGeral.Close;
    case vConec of
      cgOrigem :QryGeral.Connection    := CcnOrigem;
      cgDestino :QryGeral.Connection   := CcnDestino;
      cgParametro :QryGeral.Connection := CcnParametros;
    end;
    QryGeral.SQL.Clear;
    QryGeral.DeleteWhere;
    QryGeral.SQL.Text := Qry;
    QryGeral.Open;
    Result := (not QryGeral.IsEmpty);
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      raise;
    end;
  end;
  QryGeral.Close;
end;

Function TDM.RetornaTextoEntreChar(vTexto:String; vCaracter:array of Char):String;
var
  I,Posicao1,Posicao2:Integer;
  TextoInvertido:String;
begin
  Result:='';
  for I := Length(vTexto) downto 1 do
  begin
    TextoInvertido:=TextoInvertido+vTexto[I]
  end;
  Posicao1:=Pos(vCaracter[0],vTexto)+1;
  Posicao2:=Pos(vCaracter[1],TextoInvertido)-1;
  Result:=Copy(vTexto,Posicao1,Length(vTexto)-(Posicao1+Posicao2));
 end;

procedure TDM.LdOrigemGetColumnData(Sender: TObject; Column: TDAColumn; Row: Integer; var Value: Variant; var IsEOF: Boolean);
begin
  //cxEditRepositoryCbCamposOrigem.Properties.Items.Clear;
 // cxEditRepositoryCbCamposOrigem.Properties.Items.Add(Column.Name);
end;

procedure Tdm.executascript(script:string;vConec:TConectGet= cgDestino);
begin
  try
    StartTransaction(cgDestino);
    case vConec of
      cgOrigem :scrExecute.Connection    := CcnOrigem;
      cgDestino :scrExecute.Connection   := CcnDestino;
      cgParametro :scrExecute.Connection := CcnParametros;
    end;

    scrExecute.SQL.Text := script;
    scrExecute.Execute;
    Commit;
  except
    Roolback;
  end;
end;


function TDM.retiraracentos( str: String ): String;
var
i: Integer;
begin
  for i := 1 to Length ( str ) do
  case str[i] of
    'á': str[i] := 'a';
    'é': str[i] := 'e';
    'í': str[i] := 'i';
    'ó': str[i] := 'o';
    'ú': str[i] := 'u';
    'à': str[i] := 'a';
    'è': str[i] := 'e';
    'ì': str[i] := 'i';
    'ò': str[i] := 'o';
    'ù': str[i] := 'u';
    'â': str[i] := 'a';
    'ê': str[i] := 'e';
    'î': str[i] := 'i';
    'ô': str[i] := 'o';
    'û': str[i] := 'u';
    'ä': str[i] := 'a';
    'ë': str[i] := 'e';
    'ï': str[i] := 'i';
    'ö': str[i] := 'o';
    'ü': str[i] := 'u';
    'ã': str[i] := 'a';
    'õ': str[i] := 'o';
    'ñ': str[i] := 'n';
    'ç': str[i] := 'c';
    'Á': str[i] := 'A';
    'É': str[i] := 'E';
    'Í': str[i] := 'I';
    'Ó': str[i] := 'O';
    'Ú': str[i] := 'U';
    'À': str[i] := 'A';
    'È': str[i] := 'E';
    'Ì': str[i] := 'I';
    'Ò': str[i] := 'O';
    'Ù': str[i] := 'U';
    'Â': str[i] := 'A';
    'Ê': str[i] := 'E';
    'Î': str[i] := 'I';
    'Ô': str[i] := 'O';
    'Û': str[i] := 'U';
    'Ä': str[i] := 'A';
    'Ë': str[i] := 'E';
    'Ï': str[i] := 'I';
    'Ö': str[i] := 'O';
    'Ü': str[i] := 'U';
    'Ã': str[i] := 'A';
    'Õ': str[i] := 'O';
    'Ñ': str[i] := 'N';
    'Ç': str[i] := 'C';
  end;
  Result := str;
end;

procedure TDM.gravatabelasorigens;
var
  I,Y: Integer;
begin
  I := 0;
  CDSTVOrigem.Close;
  CDSTVOrigem.Data := NULL;
  CDSTVOrigem.CreateDataSet;
  MDOCDSOrige.First;

  while not MDOCDSOrige.eof do
  BEGIN
    CDSTVOrigem.Append;
    for I := 0 to MDOCDSOrige.Fields.Count - 1 do
    begin
      if IndexText(MDOCDSOrige.Fields[I].FieldName,['TABLE_NAME','TABLE_TYPE']) >= 0  then
        CDSTVOrigem.FieldByName(MDOCDSOrige.Fields[I].FieldName).Value := MDOCDSOrige.FieldByName(MDOCDSOrige.Fields[I].FieldName).Value;
    end;
     CDSTVOrigem.Post;
    MDOCDSOrige.Next;
  END;
  QryPersonalQuery.Close;
  QryPersonalQuery.DeleteWhere;
  QryPersonalQuery.RestoreSQL;
  QryPersonalQuery.AddWhere('ID_PROJETO = '+ QryProjetoID.AsString);
  QryPersonalQuery.Open;
  QryPersonalQuery.First;
  while not QryPersonalQuery.Eof do
  begin
    CDSTVOrigem.Append;
    CDSTVOrigemTABLE_CATALOG.AsString   := QryPersonalQuerySISTEMA.AsString;
   // CDSTVOrigemTABLE_SCHEMA.AsString    := QryPersonalQueryID_PROJETO.AsString;
    CDSTVOrigemTABLE_NAME.AsString      := QryPersonalQueryQRY_NOME.AsString;
    CDSTVOrigemTABLE_TYPE.AsString      := 'SELECT';
    CDSTVOrigemTABLE_SCHEMA.AsString    := QryPersonalQueryID.AsString;
    CDSTVOrigem.Post;
    QryPersonalQuery.Next;
  end;
end;

function TDM.RetornaTexto(Str: String): String;
var
  wptAux: TWPRichText;
begin
  wptAux := TWPRichText.Create(nil);
  try
    wptAux.AsString := Str;
    Result := wptAux.Text;
  finally
    wptAux.Free;
  end;

end;


function TDM.GetIndexFieldNamesByIndexName(const AUniConnection: TUniConnection;const AIndexName: String): String;
var
  um: TUniMetaData;
  S: String;
begin
  S := EmptyStr;

  um := TUniMetaData.Create(nil);
  try
    um.Connection := AUniConnection;
    um.Restrictions.Values['INDEX_NAME'] := AIndexName;
    um.MetaDataKind := 'IndexColumns';
    um.IndexFieldNames := 'COLUMN_POSITION';
    um.Open;

    while not um.Eof do
    begin
      S := S + um.FieldByName('COLUMN_NAME').AsString;

      if um.RecNo <> um.Recordcount then
        S := S + '; ';

      um.Next;
    end;

  finally
    um.Free;
  end;
  Result := S;
end;


function TDM.GerarSequencia(Tabela: string): Variant;
begin
  if Tabela <> '' then
  begin
    { * comentado by Paulo Augusto
      data     : 18/03/2016 09:01
      cometário: o tratamento passa a ser eito direto na procedure: G_SP_SEQUENCE
      dispensando o tratamento local, visto que a mesma ainda gerava exceção
      -------------------------------------------------------------------------
      if GetStr('SELECT SEQUENCIA FROM G_SEQUENCIA WHERE TABELA = '+QuotedStr(Tabela))= '' then
      ExecSQL('INSERT INTO G_SEQUENCIA( SEQUENCIA, TABELA  ) VALUES ( 0 ,'+QuotedStr(Tabela)+' )');
      fim do bloco ------------------------------------------------------------ }
    SP_SEQUENCIA.Params[0].AsString := Tabela;
    SP_SEQUENCIA.ExecProc;
    Result := SP_SEQUENCIA.Params[1].AsString;
  end;
end;

procedure TDM.MDOCDSOrigeAfterOpen(DataSet: TDataSet);
begin
  gravatabelasorigens;
end;

procedure TDM.MDOrigemAfterOpen(DataSet: TDataSet);
begin
  //gravatabelasorigens;
end;

procedure TDM.QryGeralBeforeOpen(DataSet: TDataSet);
begin
   if DebugHook <> 0 then
    QryGeral.sql.SaveToFile('C:\DebugSql\QryGeral.sql');
end;

procedure TDM.QryGeralExecBeforeExecute(Sender: TObject);
begin
  if DebugHook <> 0 then
    QryGeralExec.sql.SaveToFile('C:\DebugSql\QryGeralExec.sql');
end;

procedure TDM.ScriptTesteError(Sender: TObject; E: Exception; SQL: string; var Action: TErrorAction);
begin
  ShowMessage('Os sequintes erros foram encontrados em sua rotina:'+#13+E.Message);
end;

end.
