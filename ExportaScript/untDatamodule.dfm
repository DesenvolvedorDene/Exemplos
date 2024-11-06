object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 656
  Width = 1131
  object CcnOrigem: TUniConnection
    AutoCommit = False
    ProviderName = 'ODBC'
    SpecificOptions.Strings = (
      'ODBC.ColumnWiseBinding=True')
    Server = 'orizona'
    Left = 232
    Top = 10
  end
  object LdColum: TUniLoader
    Connection = CcnOrigem
    TableName = 'ADM_CLIENTES_AUX'
    Left = 232
    Top = 248
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 1024
    Top = 8
  end
  object MDOrigem: TUniMetaData
    Filtered = True
    Filter = 'TABLE_TYPE in ( '#39'TABLE'#39' , '#39'VIEW'#39')'
    AfterOpen = MDOrigemAfterOpen
    MetaDataKind = 'Tables'
    Connection = CcnOrigem
    Left = 139
    Top = 66
  end
  object DSmdOrigem: TUniDataSource
    DataSet = CDSTVOrigem
    Left = 43
    Top = 122
  end
  object CcnDestino: TUniConnection
    Left = 752
    Top = 8
  end
  object LdDestino: TUniLoader
    Connection = CcnDestino
    TableName = 'C_CAIXA_CHEQUE'
    Columns = <
      item
        Name = 'CAIXA_CHEQUE_ID'
        FieldType = ftFloat
        Precision = 18
        Scale = 2
      end
      item
        Name = 'BANCO_ID'
        Size = 10
      end
      item
        Name = 'AGENCIA'
        Size = 10
      end
      item
        Name = 'DINHEIRO_CHEQUE'
        FieldType = ftFloat
        Precision = 18
        Scale = 3
      end
      item
        Name = 'CONTA'
        Size = 10
      end
      item
        Name = 'NUMERO_CHEQUE'
        Size = 10
      end
      item
        Name = 'NOME_EMITENTE'
        Size = 60
      end
      item
        Name = 'DATA_EMISSAO'
        FieldType = ftDateTime
      end
      item
        Name = 'SITUACAO_CHEQUE'
        Size = 1
      end
      item
        Name = 'DATA_SITUACAO'
        FieldType = ftDateTime
      end
      item
        Name = 'TELEFONE_CONTATO'
        Size = 10
      end
      item
        Name = 'DOCUMENTO'
        Size = 30
      end
      item
        Name = 'CPF_CNPJ'
        Size = 15
      end
      item
        Name = 'VALOR'
        FieldType = ftFloat
        Precision = 18
        Scale = 3
      end>
    Left = 752
    Top = 160
  end
  object MDDestino: TUniMetaData
    Filtered = True
    Filter = 'TABLE_NAME LIKE '#39'T_%'#39
    MetaDataKind = 'Tables'
    Connection = CcnDestino
    Left = 752
    Top = 56
  end
  object DSmdDestino: TUniDataSource
    DataSet = MDDestino
    Left = 752
    Top = 104
  end
  object CcnParametros: TUniConnection
    ProviderName = 'SQLite'
    Database = 'D:/Bases/RegistroTDPJOrizona/conversao/OrizonaScript.sdb'
    SpecificOptions.Strings = (
      'SQLite.ForceCreateDatabase=True'
      'SQLite.UseUnicode=True'
      'SQLite.Direct=True')
    Connected = True
    LoginPrompt = False
    Left = 427
    Top = 11
  end
  object SQLiteParamprvd: TSQLiteUniProvider
    Left = 1024
    Top = 104
  end
  object QryParametros: TUniQuery
    UpdatingTable = 'CONVERSAO'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO CONVERSAO'
      
        '  (ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_DESTI' +
        'NO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, IDX_C' +
        'AMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO, TIP' +
        'ODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO, TAM' +
        '_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, PERS' +
        'ONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COMO_WH' +
        'ERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, CONVE' +
        'TER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EXEC, ' +
        'SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT, DE' +
        'FAULT_VALOR, RTFTOTEXT)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :SISTEMA, :SISTEMAID, :BANCO_ORIGEM, :BANCO' +
        '_DESTINO, :TABELA_ORIGEM, :TABELA_DESTINO, :CHAVE_PRIMARIA_DESTI' +
        'NO, :IDX_CAMPO_ORIGEM, :IDX_CAMPO_DESTINO, :CAMPO_ORIGEM, :CAMPO' +
        '_DESTINO, :TIPODADO_ORIGEM, :TIPODADO_DESTINO, :VALOR_ORIGEM, :V' +
        'ALOR_DESTINO, :TAM_CAMPO_ORIGEM, :TAM_CAMPO_DESTINO, :ACEITA_NUL' +
        'L, :GERAR_VALOR, :PERSONAL_SELECT, :PERS_SELECT_WHERE, :CARACTER' +
        'ES_REMOVER, :USAR_COMO_WHERE, :TIPOVALOR_GERAR, :VALOR_A_CONSIDE' +
        'RAR, :RETIRAR_ACENTOS, :CONVETER_MAIUSCULO, :AJUSTAR_TAMANHO, :F' +
        'ILTRAR_CARACTERES, :ORDEM_EXEC, :SEQUENCIA, :CHAVE_PRIMARIA_ORIG' +
        'EM, :TCAMPO, :COMPORCHAVEDEFAULT, :DEFAULT_VALOR, :RTFTOTEXT)')
    SQLDelete.Strings = (
      'DELETE FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE CONVERSAO'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, SISTEM' +
        'AID = :SISTEMAID, BANCO_ORIGEM = :BANCO_ORIGEM, BANCO_DESTINO = ' +
        ':BANCO_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TABELA_DESTINO =' +
        ' :TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO = :CHAVE_PRIMARIA_DESTI' +
        'NO, IDX_CAMPO_ORIGEM = :IDX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO = :I' +
        'DX_CAMPO_DESTINO, CAMPO_ORIGEM = :CAMPO_ORIGEM, CAMPO_DESTINO = ' +
        ':CAMPO_DESTINO, TIPODADO_ORIGEM = :TIPODADO_ORIGEM, TIPODADO_DES' +
        'TINO = :TIPODADO_DESTINO, VALOR_ORIGEM = :VALOR_ORIGEM, VALOR_DE' +
        'STINO = :VALOR_DESTINO, TAM_CAMPO_ORIGEM = :TAM_CAMPO_ORIGEM, TA' +
        'M_CAMPO_DESTINO = :TAM_CAMPO_DESTINO, ACEITA_NULL = :ACEITA_NULL' +
        ', GERAR_VALOR = :GERAR_VALOR, PERSONAL_SELECT = :PERSONAL_SELECT' +
        ', PERS_SELECT_WHERE = :PERS_SELECT_WHERE, CARACTERES_REMOVER = :' +
        'CARACTERES_REMOVER, USAR_COMO_WHERE = :USAR_COMO_WHERE, TIPOVALO' +
        'R_GERAR = :TIPOVALOR_GERAR, VALOR_A_CONSIDERAR = :VALOR_A_CONSID' +
        'ERAR, RETIRAR_ACENTOS = :RETIRAR_ACENTOS, CONVETER_MAIUSCULO = :' +
        'CONVETER_MAIUSCULO, AJUSTAR_TAMANHO = :AJUSTAR_TAMANHO, FILTRAR_' +
        'CARACTERES = :FILTRAR_CARACTERES, ORDEM_EXEC = :ORDEM_EXEC, SEQU' +
        'ENCIA = :SEQUENCIA, CHAVE_PRIMARIA_ORIGEM = :CHAVE_PRIMARIA_ORIG' +
        'EM, TCAMPO = :TCAMPO, COMPORCHAVEDEFAULT = :COMPORCHAVEDEFAULT, ' +
        'DEFAULT_VALOR = :DEFAULT_VALOR, RTFTOTEXT = :RTFTOTEXT'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_D' +
        'ESTINO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, I' +
        'DX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO,' +
        ' TIPODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO,' +
        ' TAM_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, ' +
        'PERSONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COM' +
        'O_WHERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, C' +
        'ONVETER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EX' +
        'EC, SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT' +
        ', DEFAULT_VALOR, RTFTOTEXT FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM CONVERSAO'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select'
      '  CV.*'
      '  ,PF.ROTINA_SQL AS _SQL'
      'from '
      '   CONVERSAO CV'
      
        ' Left Join PERSONALFIELDS PF ON CV.TABELA_DESTINO = PF.TABELA_DE' +
        'STINO AND CV.TABELA_ORIGEM = PF.TABELA_ORIGEM AND PF.PERSONAL_CA' +
        'MPO = CAMPO_DESTINO'
      ' order by BANCO_DESTINO,TABELA_DESTINO')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True'
      'SQLite.AdvancedTypeDetection=True')
    Left = 427
    Top = 59
    object QryParametrosID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryParametrosTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Size = 60
    end
    object QryParametrosTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryParametrosCAMPO_ORIGEM: TWideStringField
      FieldName = 'CAMPO_ORIGEM'
      Size = 60
    end
    object QryParametrosTIPODADO_ORIGEM: TWideStringField
      FieldName = 'TIPODADO_ORIGEM'
      Size = 30
    end
    object QryParametrosTIPODADO_DESTINO: TWideStringField
      FieldName = 'TIPODADO_DESTINO'
      Size = 30
    end
    object QryParametrosVALOR_ORIGEM: TWideMemoField
      FieldName = 'VALOR_ORIGEM'
      BlobType = ftWideMemo
    end
    object QryParametrosVALOR_DESTINO: TWideMemoField
      FieldName = 'VALOR_DESTINO'
      BlobType = ftWideMemo
    end
    object QryParametrosTAM_CAMPO_ORIGEM: TIntegerField
      FieldName = 'TAM_CAMPO_ORIGEM'
    end
    object QryParametrosTAM_CAMPO_DESTINO: TIntegerField
      FieldName = 'TAM_CAMPO_DESTINO'
    end
    object QryParametrosBANCO_ORIGEM: TWideStringField
      FieldName = 'BANCO_ORIGEM'
      Size = 60
    end
    object QryParametrosBANCO_DESTINO: TWideStringField
      FieldName = 'BANCO_DESTINO'
      Size = 60
    end
    object QryParametrosCAMPO_DESTINO: TWideStringField
      FieldName = 'CAMPO_DESTINO'
      Size = 60
    end
    object QryParametrosSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
    object QryParametrosID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryParametrosSISTEMAID: TIntegerField
      FieldName = 'SISTEMAID'
    end
    object QryParametrosACEITA_NULL: TBooleanField
      FieldName = 'ACEITA_NULL'
    end
    object QryParametrosGERAR_VALOR: TBooleanField
      FieldName = 'GERAR_VALOR'
    end
    object QryParametrosTIPOVALOR_GERAR: TIntegerField
      FieldName = 'TIPOVALOR_GERAR'
    end
    object QryParametrosVALOR_A_CONSIDERAR: TIntegerField
      FieldName = 'VALOR_A_CONSIDERAR'
    end
    object QryParametrosIDX_CAMPO_ORIGEM: TIntegerField
      FieldName = 'IDX_CAMPO_ORIGEM'
    end
    object QryParametrosIDX_CAMPO_DESTINO: TIntegerField
      FieldName = 'IDX_CAMPO_DESTINO'
    end
    object QryParametrosPERSONAL_SELECT: TWideMemoField
      FieldName = 'PERSONAL_SELECT'
      BlobType = ftWideMemo
    end
    object QryParametrosUSAR_COMO_WHERE: TBooleanField
      FieldName = 'USAR_COMO_WHERE'
    end
    object QryParametrosCARACTERES_REMOVER: TWideStringField
      FieldName = 'CARACTERES_REMOVER'
      Size = 50
    end
    object QryParametros_SQL: TWideStringField
      FieldName = '_SQL'
      ReadOnly = True
      Size = 1000
    end
    object QryParametrosRETIRAR_ACENTOS: TBooleanField
      FieldName = 'RETIRAR_ACENTOS'
    end
    object QryParametrosCONVETER_MAIUSCULO: TBooleanField
      FieldName = 'CONVETER_MAIUSCULO'
    end
    object QryParametrosFILTRAR_CARACTERES: TIntegerField
      FieldName = 'FILTRAR_CARACTERES'
    end
    object QryParametrosAJUSTAR_TAMANHO: TBooleanField
      FieldName = 'AJUSTAR_TAMANHO'
    end
    object QryParametrosCHAVE_PRIMARIA_DESTINO: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_DESTINO'
      Size = 60
    end
    object QryParametrosORDEM_EXEC: TIntegerField
      FieldName = 'ORDEM_EXEC'
    end
    object QryParametrosPERS_SELECT_WHERE: TWideMemoField
      FieldName = 'PERS_SELECT_WHERE'
      BlobType = ftWideMemo
    end
    object QryParametrosSEQUENCIA: TWideStringField
      FieldName = 'SEQUENCIA'
      Size = 60
    end
    object QryParametrosCHAVE_PRIMARIA_ORIGEM: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_ORIGEM'
      Size = 60
    end
    object QryParametrosTCAMPO: TWideStringField
      FieldName = 'TCAMPO'
      Size = 3
    end
    object QryParametrosCOMPORCHAVEDEFAULT: TBooleanField
      FieldName = 'COMPORCHAVEDEFAULT'
    end
    object QryParametrosDEFAULT_VALOR: TWideStringField
      FieldName = 'DEFAULT_VALOR'
      Size = 300
    end
    object QryParametrosRTFTOTEXT: TBooleanField
      FieldName = 'RTFTOTEXT'
    end
  end
  object QryProjeto: TUniQuery
    UpdatingTable = 'TABELAPROJETO'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO TABELAPROJETO'
      
        '  (ID, PROJETO_NOME, CONEXAO_ORIGEM, CONEXAO_DESTINO, DATA_PROJE' +
        'TO, RESPONSAVEL_NOME, CLIENTE_NOME)'
      'VALUES'
      
        '  (:ID, :PROJETO_NOME, :CONEXAO_ORIGEM, :CONEXAO_DESTINO, :DATA_' +
        'PROJETO, :RESPONSAVEL_NOME, :CLIENTE_NOME)')
    SQLDelete.Strings = (
      'DELETE FROM TABELAPROJETO'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE TABELAPROJETO'
      'SET'
      
        '  ID = :ID, PROJETO_NOME = :PROJETO_NOME, CONEXAO_ORIGEM = :CONE' +
        'XAO_ORIGEM, CONEXAO_DESTINO = :CONEXAO_DESTINO, DATA_PROJETO = :' +
        'DATA_PROJETO, RESPONSAVEL_NOME = :RESPONSAVEL_NOME, CLIENTE_NOME' +
        ' = :CLIENTE_NOME'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, PROJETO_NOME, CONEXAO_ORIGEM, CONEXAO_DESTINO, DATA_P' +
        'ROJETO, RESPONSAVEL_NOME, CLIENTE_NOME FROM TABELAPROJETO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM TABELAPROJETO'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select * from TABELAPROJETO')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 427
    Top = 163
    object QryProjetoID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryProjetoPROJETO_NOME: TWideStringField
      DisplayLabel = 'Nome do Projeto'
      FieldName = 'PROJETO_NOME'
      Size = 80
    end
    object QryProjetoCONEXAO_ORIGEM: TWideStringField
      DisplayLabel = 'Origem'
      FieldName = 'CONEXAO_ORIGEM'
      Size = 200
    end
    object QryProjetoCONEXAO_DESTINO: TWideStringField
      DisplayLabel = 'Destino'
      FieldName = 'CONEXAO_DESTINO'
      Size = 200
    end
    object QryProjetoDATA_PROJETO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA_PROJETO'
    end
    object QryProjetoRESPONSAVEL_NOME: TWideStringField
      FieldName = 'RESPONSAVEL_NOME'
      Size = 100
    end
    object QryProjetoCLIENTE_NOME: TWideStringField
      FieldName = 'CLIENTE_NOME'
      Size = 100
    end
  end
  object DSParametro: TUniDataSource
    DataSet = QryParametros
    Left = 427
    Top = 115
  end
  object InterBaseUniProvider1: TInterBaseUniProvider
    Left = 1024
    Top = 56
  end
  object CDOrigem: TUniConnectDialog
    DatabaseLabel = 'Base de dados'
    PortLabel = 'Porta'
    ProviderLabel = 'Fornecedor'
    Caption = 'Iniciar Sess'#227'o Origem'
    UsernameLabel = 'Nome do Usu'#225'rio'
    PasswordLabel = 'Senha'
    ServerLabel = 'Servidor'
    ConnectButton = 'Ok'
    CancelButton = 'Cancelar'
    LabelSet = lsCustom
    Left = 139
    Top = 10
  end
  object CDSTabelas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 43
    Top = 288
    object CDSTabelasidx: TAutoIncField
      FieldName = 'idx'
    end
    object CDSTabelasTabelaOrigem: TStringField
      FieldName = 'TabelaOrigem'
      Size = 80
    end
    object CDSTabelasTabelaDestino: TStringField
      FieldName = 'TabelaDestino'
      Size = 80
    end
  end
  object DSTabelas: TDataSource
    DataSet = CDSTabelas
    Left = 139
    Top = 296
  end
  object cxEditRepository1: TcxEditRepository
    Left = 232
    Top = 184
    object cxEditRepositoryCbCamposOrigem: TcxEditRepositoryComboBoxItem
    end
  end
  object MDField: TUniMetaData
    Filtered = True
    MetaDataKind = 'Columns'
    Restrictions.Strings = (
      'TABLE_NAME=T_PESSOA')
    Connection = CcnDestino
    Left = 139
    Top = 240
  end
  object DSOrigemField: TUniDataSource
    DataSet = CDSOrigemField
    Left = 232
    Top = 128
  end
  object CDSOrigemField: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 139
    Top = 184
    object CDSOrigemFieldTABLE_CATALOG: TStringField
      FieldName = 'TABLE_CATALOG'
      Size = 1
    end
    object CDSOrigemFieldTABLE_SCHEMA: TStringField
      FieldName = 'TABLE_SCHEMA'
      Size = 1
    end
    object CDSOrigemFieldTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object CDSOrigemFieldCOLUMN_NAME: TStringField
      FieldName = 'COLUMN_NAME'
      Size = 100
    end
    object CDSOrigemFieldPOSITION: TIntegerField
      FieldName = 'POSITION'
    end
    object CDSOrigemFieldDATA_TYPE: TIntegerField
      FieldName = 'DATA_TYPE'
    end
    object CDSOrigemFieldDATA_LENGTH: TIntegerField
      FieldName = 'DATA_LENGTH'
    end
    object CDSOrigemFieldDATA_PRECISION: TIntegerField
      FieldName = 'DATA_PRECISION'
    end
    object CDSOrigemFieldDATA_SCALE: TIntegerField
      FieldName = 'DATA_SCALE'
    end
    object CDSOrigemFieldNULLABLE: TIntegerField
      FieldName = 'NULLABLE'
    end
    object CDSOrigemFieldDEFAULT_VALUE: TMemoField
      FieldName = 'DEFAULT_VALUE'
      BlobType = ftMemo
    end
  end
  object Scriptparametro: TUniScript
    SQL.Strings = (
      '--DROP TABLE IF EXISTS TABELAPROJETO;'
      'CREATE TABLE IF NOT EXISTS TABELAPROJETO('
      '     ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT'
      '    ,PROJETO_NOME           VARCHAR(80)'
      '    ,CONEXAO_ORIGEM'#9'    VARCHAR(200)'
      '    ,CONEXAO_DESTINO'#9'    VARCHAR(200)'
      '    ,DATA_PROJETO'#9'    DATE'
      '    ,RESPONSAVEL_NOME       VARCHAR(100)'
      '    ,CLIENTE_NOME           VARCHAR(100)'
      '    '
      ');'
      ''
      '--DROP TABLE IF EXISTS PERSONALQUERIES;'
      'CREATE TABLE IF NOT EXISTS PERSONALQUERIES('
      '    ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT'
      '   ,ID_PROJETO              INTEGER REFERENCES TABELAPROJETO(ID)'
      '   ,SISTEMA                 VARCHAR(60)'
      '   ,QRY_NOME                VARCHAR(60)'
      '   ,QRY_TEXT                TEXT'
      '   ,QRY_OBS                 TEXT'
      ');'
      ''
      '--DROP TABLE IF EXISTS CONVERSAO_ORDEM;'
      'CREATE TABLE IF NOT EXISTS CONVERSAO_ORDEM('
      '    ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT'
      
        '   ,ID_PROJETO              INTEGER REFERENCES TABELAPROJETO(ID)' +
        ' '
      '   ,TABELA_ORIGEM           VARCHAR(60)      NOT NULL'
      '   ,TABELA_DESTINO          VARCHAR(60)      NOT NULL'
      '   ,ORDEM_EXEC              INTEGER DEFAULT 0'
      '   ,ORIGEM_G_CHAVE          TEXT'
      ');'
      ''
      '--DROP TABLE IF EXISTS CONVERSAO;'
      'CREATE TABLE IF NOT EXISTS CONVERSAO('
      '    ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT'
      '   ,ID_PROJETO              INTEGER REFERENCES TABELAPROJETO(ID)'
      '   ,SISTEMA                 VARCHAR(60)      NOT NULL'
      '   ,SISTEMAID               INTEGER'
      '   ,BANCO_ORIGEM            VARCHAR(60)      NOT NULL'
      '   ,BANCO_DESTINO           VARCHAR(60)      NOT NULL'
      '   ,TABELA_ORIGEM           VARCHAR(60)      NOT NULL'
      '   ,TABELA_DESTINO          VARCHAR(60)      NOT NULL'
      '   ,CHAVE_PRIMARIA_DESTINO  VARCHAR(60)'
      '   ,IDX_CAMPO_ORIGEM        INTEGER'
      '   ,IDX_CAMPO_DESTINO       INTEGER'
      '   ,CAMPO_ORIGEM'#9'    VARCHAR(60)'#9#9' NOT NULL'
      '   ,CAMPO_DESTINO'#9'    VARCHAR(60)'#9#9' NOT NULL'
      '   ,TIPODADO_ORIGEM'#9'    VARCHAR(30)      NOT NULL'
      '   ,TIPODADO_DESTINO'#9'    VARCHAR(30)      NOT NULL'
      '   ,VALOR_ORIGEM'#9'    TEXT'
      '   ,VALOR_DESTINO'#9'    TEXT'
      '   ,TAM_CAMPO_ORIGEM        INTEGER'
      '   ,TAM_CAMPO_DESTINO       INTEGER '
      '   ,ACEITA_NULL             BOOLEAN NOT NULL DEFAULT FALSE'
      '   ,GERAR_VALOR             BOOLEAN NOT NULL DEFAULT FALSE'
      '   ,PERSONAL_SELECT         TEXT'
      '   ,PERS_SELECT_WHERE       TEXT'
      '   ,CARACTERES_REMOVER      VARCHAR(50)'
      '   ,USAR_COMO_WHERE         BOOLEAN DEFAULT FALSE '
      
        '   ,TIPOVALOR_GERAR         INTEGER --0 GEAR SEQUENCIA 1 ACRECER' +
        ' VALOR SEQUENCIA  2 DECRECER VALOR SEQUENCIA  3 INCREMETAR SEQUE' +
        'NCIA APATIR VALOR'
      '   ,VALOR_A_CONSIDERAR'#9'    INTEGER'
      '   ,RETIRAR_ACENTOS         BOOLEAN DEFAULT FALSE'
      '   ,CONVETER_MAIUSCULO      BOOLEAN DEFAULT FALSE'
      '   ,AJUSTAR_TAMANHO         BOOLEAN DEFAULT FALSE'
      '   ,RTFTOTEXT               BOOLEAN DEFAULT FALSE'
      '   ,FILTRAR_CARACTERES      INTEGER DEFAULT -1'
      '   ,ORDEM_EXEC              INTEGER DEFAULT 0'
      '   ,SEQUENCIA               varchar(60)'
      '   ,CHAVE_PRIMARIA_ORIGEM   varchar(60)'
      '   ,TCAMPO                  varchar(3)'
      '   ,COMPORCHAVEDEFAULT      BOOLEAN DEFAULT FALSE'
      '   ,DEFAULT_VALOR           varchar(300)'
      ');'
      ''
      '--DROP TABLE IF EXISTS PERSONALFIELDS;'
      'CREATE TABLE IF NOT EXISTS PERSONALFIELDS('
      '    ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT '
      '   ,ID_PROJETO              INTEGER REFERENCES TABELAPROJETO(ID)'
      '   ,TABELA_DESTINO          VARCHAR(60)      NOT NULL'
      '   ,TABELA_ORIGEM           VARCHAR(60)      NOT NULL'
      '   ,PERSONAL_CAMPO          VARCHAR(60)'
      '   ,TIPO_CAMPO              VARCHAR(60)'
      '   ,ROTINA_SQL              VARCHAR(1000)'
      ');'
      ''
      '--DROP TABLE IF EXISTS PERSONALWHERES;'
      'CREATE TABLE IF NOT EXISTS PERSONALWHERES('
      '    ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT '
      '   ,ID_PROJETO              INTEGER REFERENCES TABELAPROJETO(ID)'
      '   ,TABELA_DESTINO          VARCHAR(60)      NOT NULL'
      '   ,TABELA_ORIGEM           VARCHAR(60)      NOT NULL'
      '   ,CAMPO_WHERE             VARCHAR(60)'
      '   ,TIPO_CAMPOWHR           VARCHAR(60)'
      '   ,ROTINA_SQL              VARCHAR(1000)'
      '   ,SE_EXISTE               VARCHAR(1) DEFAULT '#39'N'#39
      '   ,COMPARACOES             TEXT'
      ');'
      ''
      '--DROP TABLE IF EXISTS SUBSTQUERIES;'
      'CREATE TABLE IF NOT EXISTS SUBSTQUERIES('
      '    ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT'
      '   ,ID_CONVERSAO            INTEGER REFERENCES CONVERSAO(ID)'
      '   ,TABELA_DESTINO          VARCHAR(60)      NOT NULL'
      '   ,TABELA_ORIGEM           VARCHAR(60)      NOT NULL'
      '   ,CAMPO                   VARCHAR(60)'
      '   ,TIPO_CAMPO              VARCHAR(60)'
      '   ,VALOR_ORIGEM            VARCHAR(60)'
      '   ,VALOR_DESTINO           VARCHAR(60)'
      '   ,REFERENTE               VARCHAR(1)'
      '   ,ROTINA_SQL              TEXT'
      ');'
      ''
      '--DROP TABLE IF EXISTS TABELASCRIPTS;'
      'CREATE TABLE IF NOT EXISTS TABELASCRIPTS('
      '     ID           '#9'    INTEGER PRIMARY KEY AUTOINCREMENT'
      '    ,ID_PROJETO             INTEGER REFERENCES TABELAPROJETO(ID)'
      '    ,TABELA_DESTINO         VARCHAR(60) NOT NULL '
      '    ,TABELA_ORIGEM          VARCHAR(60) NOT NULL '
      
        '    ,TIPO_SCRIPT'#9'    VARCHAR(1)  NOT NULL DEFAULT '#39'T'#39' --('#39'B'#39','#39'T'#39 +
        ','#39'S'#39') Banco,Tabela,Script_geral  '
      '    ,SCRIPT'#9'            TEXT'
      '    ,SCRIPT_ARQ             BLOB'
      '    ,DATA_INSERT'#9'    DATETIME DEFAULT CURRENT_TIMESTAMP'
      '    ,RESPONSAVEL_NOME       VARCHAR(100)'
      '    ,NOME_ARQUIVO           VARCHAR(80)'
      ');'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Connection = CcnParametros
    Left = 519
    Top = 219
  end
  object DSProjeto: TUniDataSource
    DataSet = QryProjeto
    Left = 427
    Top = 219
  end
  object QrySelect: TUniQuery
    Connection = CcnOrigem
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 139
    Top = 130
  end
  object QryExecuteparam: TUniQuery
    UpdatingTable = 'CONVERSAO'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO CONVERSAO'
      '  (ID, ORDEM_EXEC)'
      'VALUES'
      '  (:ID, :ORDEM_EXEC)')
    SQLDelete.Strings = (
      'DELETE FROM CONVERSAO'
      'WHERE'
      
        '  TABELA_ORIGEM = :Old_TABELA_ORIGEM AND TABELA_DESTINO = :Old_T' +
        'ABELA_DESTINO')
    SQLUpdate.Strings = (
      'UPDATE CONVERSAO'
      'SET'
      '  ORDEM_EXEC = :ORDEM_EXEC'
      'WHERE'
      
        '  TABELA_ORIGEM = :Old_TABELA_ORIGEM AND TABELA_DESTINO = :Old_T' +
        'ABELA_DESTINO')
    SQLRefresh.Strings = (
      'SELECT ID, ORDEM_EXEC FROM CONVERSAO'
      'WHERE'
      
        '  TABELA_ORIGEM = :Old_TABELA_ORIGEM AND TABELA_DESTINO = :Old_T' +
        'ABELA_DESTINO')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM CONVERSAO'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'SELECT'
      '  c.SISTEMA'
      ' ,c.CHAVE_PRIMARIA_DESTINO  '
      ' ,CAST(0 AS BOOLEAN) as MARCADO '
      ' ,COALESCE(c.ORDEM_EXEC,0) as ORDEM_EXEC  '
      ' ,c.TABELA_ORIGEM'
      ' ,c.TABELA_DESTINO'
      ' ,cast(0 as integer) as somaordem '
      'FROM '
      '  CONVERSAO c '
      
        '  inner join (SELECT MAX(ID) AS ID, TABELA_ORIGEM,TABELA_DESTINO' +
        ' FROM CONVERSAO GROUP BY TABELA_ORIGEM,TABELA_DESTINO order by i' +
        'd) gc on c.id =gc.id'
      ' -- WHERE '
      
        '   -- c.ID IN ( SELECT ID  FROM (SELECT MAX(ID) AS ID, TABELA_OR' +
        'IGEM,TABELA_DESTINO FROM CONVERSAO GROUP BY TABELA_ORIGEM,TABELA' +
        '_DESTINO order by id))'
      'ORDER BY ORDEM_EXEC')
    CachedUpdates = True
    Options.StrictUpdate = False
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True'
      'SQLite.AdvancedTypeDetection=True')
    Left = 519
    Top = 11
    object QryExecuteparamSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
    object QryExecuteparamTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Size = 60
    end
    object QryExecuteparamTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryExecuteparamCHAVE_PRIMARIA_DESTINO: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_DESTINO'
      Size = 60
    end
    object QryExecuteparamMARCADO: TLargeintField
      FieldName = 'MARCADO'
    end
    object QryExecuteparamORDEM_EXEC: TLargeintField
      FieldName = 'ORDEM_EXEC'
    end
    object QryExecuteparamsomaordem: TLargeintField
      FieldName = 'somaordem'
      ReadOnly = True
    end
  end
  object QryParamins: TUniQuery
    UpdatingTable = 'CONVERSAO'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO CONVERSAO'
      
        '  (ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_DESTI' +
        'NO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, IDX_C' +
        'AMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO, TIP' +
        'ODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO, TAM' +
        '_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, PERS' +
        'ONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COMO_WH' +
        'ERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, CONVE' +
        'TER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EXEC, ' +
        'SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT, DE' +
        'FAULT_VALOR, RTFTOTEXT)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :SISTEMA, :SISTEMAID, :BANCO_ORIGEM, :BANCO' +
        '_DESTINO, :TABELA_ORIGEM, :TABELA_DESTINO, :CHAVE_PRIMARIA_DESTI' +
        'NO, :IDX_CAMPO_ORIGEM, :IDX_CAMPO_DESTINO, :CAMPO_ORIGEM, :CAMPO' +
        '_DESTINO, :TIPODADO_ORIGEM, :TIPODADO_DESTINO, :VALOR_ORIGEM, :V' +
        'ALOR_DESTINO, :TAM_CAMPO_ORIGEM, :TAM_CAMPO_DESTINO, :ACEITA_NUL' +
        'L, :GERAR_VALOR, :PERSONAL_SELECT, :PERS_SELECT_WHERE, :CARACTER' +
        'ES_REMOVER, :USAR_COMO_WHERE, :TIPOVALOR_GERAR, :VALOR_A_CONSIDE' +
        'RAR, :RETIRAR_ACENTOS, :CONVETER_MAIUSCULO, :AJUSTAR_TAMANHO, :F' +
        'ILTRAR_CARACTERES, :ORDEM_EXEC, :SEQUENCIA, :CHAVE_PRIMARIA_ORIG' +
        'EM, :TCAMPO, :COMPORCHAVEDEFAULT, :DEFAULT_VALOR, :RTFTOTEXT)')
    SQLDelete.Strings = (
      'DELETE FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE CONVERSAO'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, SISTEM' +
        'AID = :SISTEMAID, BANCO_ORIGEM = :BANCO_ORIGEM, BANCO_DESTINO = ' +
        ':BANCO_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TABELA_DESTINO =' +
        ' :TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO = :CHAVE_PRIMARIA_DESTI' +
        'NO, IDX_CAMPO_ORIGEM = :IDX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO = :I' +
        'DX_CAMPO_DESTINO, CAMPO_ORIGEM = :CAMPO_ORIGEM, CAMPO_DESTINO = ' +
        ':CAMPO_DESTINO, TIPODADO_ORIGEM = :TIPODADO_ORIGEM, TIPODADO_DES' +
        'TINO = :TIPODADO_DESTINO, VALOR_ORIGEM = :VALOR_ORIGEM, VALOR_DE' +
        'STINO = :VALOR_DESTINO, TAM_CAMPO_ORIGEM = :TAM_CAMPO_ORIGEM, TA' +
        'M_CAMPO_DESTINO = :TAM_CAMPO_DESTINO, ACEITA_NULL = :ACEITA_NULL' +
        ', GERAR_VALOR = :GERAR_VALOR, PERSONAL_SELECT = :PERSONAL_SELECT' +
        ', PERS_SELECT_WHERE = :PERS_SELECT_WHERE, CARACTERES_REMOVER = :' +
        'CARACTERES_REMOVER, USAR_COMO_WHERE = :USAR_COMO_WHERE, TIPOVALO' +
        'R_GERAR = :TIPOVALOR_GERAR, VALOR_A_CONSIDERAR = :VALOR_A_CONSID' +
        'ERAR, RETIRAR_ACENTOS = :RETIRAR_ACENTOS, CONVETER_MAIUSCULO = :' +
        'CONVETER_MAIUSCULO, AJUSTAR_TAMANHO = :AJUSTAR_TAMANHO, FILTRAR_' +
        'CARACTERES = :FILTRAR_CARACTERES, ORDEM_EXEC = :ORDEM_EXEC, SEQU' +
        'ENCIA = :SEQUENCIA, CHAVE_PRIMARIA_ORIGEM = :CHAVE_PRIMARIA_ORIG' +
        'EM, TCAMPO = :TCAMPO, COMPORCHAVEDEFAULT = :COMPORCHAVEDEFAULT, ' +
        'DEFAULT_VALOR = :DEFAULT_VALOR, RTFTOTEXT = :RTFTOTEXT'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_D' +
        'ESTINO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, I' +
        'DX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO,' +
        ' TIPODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO,' +
        ' TAM_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, ' +
        'PERSONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COM' +
        'O_WHERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, C' +
        'ONVETER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EX' +
        'EC, SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT' +
        ', DEFAULT_VALOR, RTFTOTEXT FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM CONVERSAO'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select'
      '  * '
      'from '
      '   CONVERSAO'
      ' ')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 519
    Top = 59
    object QryParaminsID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryParaminsTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Size = 60
    end
    object QryParaminsTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryParaminsCAMPO_ORIGEM: TWideStringField
      FieldName = 'CAMPO_ORIGEM'
      Size = 60
    end
    object QryParaminsTIPODADO_ORIGEM: TWideStringField
      FieldName = 'TIPODADO_ORIGEM'
      Size = 30
    end
    object QryParaminsTIPODADO_DESTINO: TWideStringField
      FieldName = 'TIPODADO_DESTINO'
      Size = 30
    end
    object QryParaminsVALOR_ORIGEM: TWideMemoField
      FieldName = 'VALOR_ORIGEM'
      BlobType = ftWideMemo
    end
    object QryParaminsVALOR_DESTINO: TWideMemoField
      FieldName = 'VALOR_DESTINO'
      BlobType = ftWideMemo
    end
    object QryParaminsTAM_CAMPO_ORIGEM: TIntegerField
      FieldName = 'TAM_CAMPO_ORIGEM'
    end
    object QryParaminsTAM_CAMPO_DESTINO: TIntegerField
      FieldName = 'TAM_CAMPO_DESTINO'
    end
    object QryParaminsBANCO_ORIGEM: TWideStringField
      FieldName = 'BANCO_ORIGEM'
      Size = 60
    end
    object QryParaminsBANCO_DESTINO: TWideStringField
      FieldName = 'BANCO_DESTINO'
      Size = 60
    end
    object QryParaminsCAMPO_DESTINO: TWideStringField
      FieldName = 'CAMPO_DESTINO'
      Size = 60
    end
    object QryParaminsSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
    object QryParaminsID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryParaminsSISTEMAID: TIntegerField
      FieldName = 'SISTEMAID'
    end
    object QryParaminsACEITA_NULL: TBooleanField
      FieldName = 'ACEITA_NULL'
    end
    object QryParaminsGERAR_VALOR: TBooleanField
      FieldName = 'GERAR_VALOR'
    end
    object QryParaminsTIPOVALOR_GERAR: TIntegerField
      FieldName = 'TIPOVALOR_GERAR'
    end
    object QryParaminsVALOR_A_CONSIDERAR: TIntegerField
      FieldName = 'VALOR_A_CONSIDERAR'
    end
    object QryParaminsIDX_CAMPO_ORIGEM: TIntegerField
      FieldName = 'IDX_CAMPO_ORIGEM'
    end
    object QryParaminsIDX_CAMPO_DESTINO: TIntegerField
      FieldName = 'IDX_CAMPO_DESTINO'
    end
    object QryParaminsPERSONAL_SELECT: TWideMemoField
      FieldName = 'PERSONAL_SELECT'
      BlobType = ftWideMemo
    end
    object QryParaminsUSAR_COMO_WHERE: TBooleanField
      FieldName = 'USAR_COMO_WHERE'
    end
    object QryParaminsCARACTERES_REMOVER: TWideStringField
      FieldName = 'CARACTERES_REMOVER'
      Size = 50
    end
    object QryParaminsRETIRAR_ACENTOS: TBooleanField
      FieldName = 'RETIRAR_ACENTOS'
    end
    object QryParaminsCONVETER_MAIUSCULO: TBooleanField
      FieldName = 'CONVETER_MAIUSCULO'
    end
    object QryParaminsFILTRAR_CARACTERES: TIntegerField
      FieldName = 'FILTRAR_CARACTERES'
    end
    object QryParaminsAJUSTAR_TAMANHO: TBooleanField
      FieldName = 'AJUSTAR_TAMANHO'
    end
    object QryParaminsCHAVE_PRIMARIA_DESTINO: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_DESTINO'
      Size = 60
    end
    object QryParaminsORDEM_EXEC: TIntegerField
      FieldName = 'ORDEM_EXEC'
    end
    object QryParaminsPERS_SELECT_WHERE: TWideMemoField
      FieldName = 'PERS_SELECT_WHERE'
      BlobType = ftWideMemo
    end
    object QryParaminsSEQUENCIA: TWideStringField
      FieldName = 'SEQUENCIA'
      Size = 10
    end
    object QryParaminsCHAVE_PRIMARIA_ORIGEM: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_ORIGEM'
      Size = 60
    end
    object QryParaminsTCAMPO: TWideStringField
      FieldName = 'TCAMPO'
      Size = 3
    end
    object QryParaminsCOMPORCHAVEDEFAULT: TBooleanField
      FieldName = 'COMPORCHAVEDEFAULT'
    end
    object QryParaminsDEFAULT_VALOR: TWideStringField
      FieldName = 'DEFAULT_VALOR'
      Size = 300
    end
    object QryParaminsRTFTOTEXT: TBooleanField
      FieldName = 'RTFTOTEXT'
    end
  end
  object DSPTVOrigem: TDataSetProvider
    DataSet = MDOrigem
    ResolveToDataSet = True
    Left = 43
    Top = 10
  end
  object QryPersonalQuery: TUniQuery
    UpdatingTable = 'PERSONALQUERIES'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO PERSONALQUERIES'
      '  (ID, ID_PROJETO, SISTEMA, QRY_NOME, QRY_TEXT, QRY_OBS)'
      'VALUES'
      '  (:ID, :ID_PROJETO, :SISTEMA, :QRY_NOME, :QRY_TEXT, :QRY_OBS)')
    SQLDelete.Strings = (
      'DELETE FROM PERSONALQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE PERSONALQUERIES'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, QRY_NO' +
        'ME = :QRY_NOME, QRY_TEXT = :QRY_TEXT, QRY_OBS = :QRY_OBS'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, QRY_NOME, QRY_TEXT, QRY_OBS FROM' +
        ' PERSONALQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM PERSONALQUERIES'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'select * from PERSONALQUERIES ')
    CachedUpdates = True
    Left = 519
    Top = 163
    object QryPersonalQueryID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryPersonalQueryID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryPersonalQueryQRY_NOME: TWideStringField
      FieldName = 'QRY_NOME'
      Size = 60
    end
    object QryPersonalQueryQRY_TEXT: TWideMemoField
      FieldName = 'QRY_TEXT'
      BlobType = ftWideMemo
    end
    object QryPersonalQueryQRY_OBS: TWideMemoField
      FieldName = 'QRY_OBS'
      BlobType = ftWideMemo
    end
    object QryPersonalQuerySISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
  end
  object DSPersonalQuery: TUniDataSource
    DataSet = QryPersonalQuery
    Left = 752
    Top = 216
  end
  object ScriptTeste: TUniScript
    OnError = ScriptTesteError
    Connection = CcnOrigem
    Left = 43
    Top = 232
  end
  object CDSTVOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 43
    Top = 178
    object CDSTVOrigemTABLE_CATALOG: TStringField
      FieldName = 'TABLE_CATALOG'
      Size = 128
    end
    object CDSTVOrigemTABLE_SCHEMA: TStringField
      FieldName = 'TABLE_SCHEMA'
      Size = 128
    end
    object CDSTVOrigemTABLE_NAME: TStringField
      DisplayLabel = 'Tabela'
      FieldName = 'TABLE_NAME'
      Size = 128
    end
    object CDSTVOrigemTABLE_TYPE: TStringField
      FieldName = 'TABLE_TYPE'
    end
  end
  object MDOCDSOrige: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DSPTVOrigem'
    StoreDefs = True
    AfterOpen = MDOCDSOrigeAfterOpen
    Left = 43
    Top = 64
    object MDOCDSOrigeTABLE_CATALOG: TStringField
      FieldName = 'TABLE_CATALOG'
      Size = 1
    end
    object MDOCDSOrigeTABLE_SCHEMA: TStringField
      FieldName = 'TABLE_SCHEMA'
      Size = 1
    end
    object MDOCDSOrigeTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Size = 100
    end
    object MDOCDSOrigeTABLE_TYPE: TStringField
      FieldName = 'TABLE_TYPE'
    end
  end
  object QrySelectPrj: TUniQuery
    Connection = CcnOrigem
    Left = 232
    Top = 64
  end
  object QrySubstQueries: TUniQuery
    UpdatingTable = 'SUBSTQUERIES'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO SUBSTQUERIES'
      
        '  (ID, ID_CONVERSAO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO, TIPO_' +
        'CAMPO, VALOR_ORIGEM, VALOR_DESTINO, ROTINA_SQL, REFERENTE)'
      'VALUES'
      
        '  (:ID, :ID_CONVERSAO, :TABELA_DESTINO, :TABELA_ORIGEM, :CAMPO, ' +
        ':TIPO_CAMPO, :VALOR_ORIGEM, :VALOR_DESTINO, :ROTINA_SQL, :REFERE' +
        'NTE)')
    SQLDelete.Strings = (
      'DELETE FROM SUBSTQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE SUBSTQUERIES'
      'SET'
      
        '  ID = :ID, ID_CONVERSAO = :ID_CONVERSAO, TABELA_DESTINO = :TABE' +
        'LA_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, CAMPO = :CAMPO, TIPO' +
        '_CAMPO = :TIPO_CAMPO, VALOR_ORIGEM = :VALOR_ORIGEM, VALOR_DESTIN' +
        'O = :VALOR_DESTINO, ROTINA_SQL = :ROTINA_SQL, REFERENTE = :REFER' +
        'ENTE'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_CONVERSAO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO, T' +
        'IPO_CAMPO, VALOR_ORIGEM, VALOR_DESTINO, ROTINA_SQL, REFERENTE FR' +
        'OM SUBSTQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM SUBSTQUERIES'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select '
      '  *'
      'from '
      'SUBSTQUERIES'
      '')
    CachedUpdates = True
    Left = 427
    Top = 263
    object QrySubstQueriesID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QrySubstQueriesID_CONVERSAO: TIntegerField
      FieldName = 'ID_CONVERSAO'
    end
    object QrySubstQueriesVALOR_ORIGEM: TWideStringField
      FieldName = 'VALOR_ORIGEM'
      Size = 60
    end
    object QrySubstQueriesVALOR_DESTINO: TWideStringField
      FieldName = 'VALOR_DESTINO'
      Size = 60
    end
    object QrySubstQueriesROTINA_SQL: TWideMemoField
      FieldName = 'ROTINA_SQL'
      BlobType = ftWideMemo
    end
    object QrySubstQueriesCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Size = 60
    end
    object QrySubstQueriesTIPO_CAMPO: TWideStringField
      FieldName = 'TIPO_CAMPO'
      Size = 60
    end
    object QrySubstQueriesTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Required = True
      Size = 60
    end
    object QrySubstQueriesTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object QrySubstQueriesREFERENTE: TWideStringField
      FieldName = 'REFERENTE'
      Size = 1
    end
  end
  object DSQryParametros: TUniDataSource
    DataSet = QryParametros
    Left = 519
    Top = 263
  end
  object QrySubstQueriesins: TUniQuery
    UpdatingTable = 'SUBSTQUERIES'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO SUBSTQUERIES'
      
        '  (ID, ID_CONVERSAO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO, TIPO_' +
        'CAMPO, VALOR_ORIGEM, VALOR_DESTINO, ROTINA_SQL, REFERENTE)'
      'VALUES'
      
        '  (:ID, :ID_CONVERSAO, :TABELA_DESTINO, :TABELA_ORIGEM, :CAMPO, ' +
        ':TIPO_CAMPO, :VALOR_ORIGEM, :VALOR_DESTINO, :ROTINA_SQL, :REFERE' +
        'NTE)')
    SQLDelete.Strings = (
      'DELETE FROM SUBSTQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE SUBSTQUERIES'
      'SET'
      
        '  ID = :ID, ID_CONVERSAO = :ID_CONVERSAO, TABELA_DESTINO = :TABE' +
        'LA_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, CAMPO = :CAMPO, TIPO' +
        '_CAMPO = :TIPO_CAMPO, VALOR_ORIGEM = :VALOR_ORIGEM, VALOR_DESTIN' +
        'O = :VALOR_DESTINO, ROTINA_SQL = :ROTINA_SQL, REFERENTE = :REFER' +
        'ENTE'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_CONVERSAO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO, T' +
        'IPO_CAMPO, VALOR_ORIGEM, VALOR_DESTINO, ROTINA_SQL, REFERENTE FR' +
        'OM SUBSTQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM SUBSTQUERIES'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select '
      '  *'
      ' from '
      '   SUBSTQUERIES'
      ' ')
    CachedUpdates = True
    Left = 519
    Top = 115
    object QrySubstQueriesinsID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QrySubstQueriesinsID_CONVERSAO: TIntegerField
      FieldName = 'ID_CONVERSAO'
    end
    object QrySubstQueriesinsVALOR_ORIGEM: TWideStringField
      FieldName = 'VALOR_ORIGEM'
      Size = 60
    end
    object QrySubstQueriesinsVALOR_DESTINO: TWideStringField
      FieldName = 'VALOR_DESTINO'
      Size = 60
    end
    object QrySubstQueriesinsROTINA_SQL: TWideMemoField
      FieldName = 'ROTINA_SQL'
      BlobType = ftWideMemo
    end
    object QrySubstQueriesinsCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Size = 60
    end
    object QrySubstQueriesinsTIPO_CAMPO: TWideStringField
      FieldName = 'TIPO_CAMPO'
      Size = 60
    end
    object QrySubstQueriesinsTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Required = True
      Size = 60
    end
    object QrySubstQueriesinsTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object QrySubstQueriesinsREFERENTE: TWideStringField
      FieldName = 'REFERENTE'
      Size = 1
    end
  end
  object DSQryParamins: TUniDataSource
    DataSet = QryParametros
    Left = 624
    Top = 59
  end
  object QryPersQueryExec: TUniQuery
    UpdatingTable = 'PERSONALQUERIES'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO PERSONALQUERIES'
      '  (ID, ID_PROJETO, SISTEMA, QRY_NOME, QRY_TEXT, QRY_OBS)'
      'VALUES'
      '  (:ID, :ID_PROJETO, :SISTEMA, :QRY_NOME, :QRY_TEXT, :QRY_OBS)')
    SQLDelete.Strings = (
      'DELETE FROM PERSONALQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE PERSONALQUERIES'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, QRY_NO' +
        'ME = :QRY_NOME, QRY_TEXT = :QRY_TEXT, QRY_OBS = :QRY_OBS'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, QRY_NOME, QRY_TEXT, QRY_OBS FROM' +
        ' PERSONALQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM PERSONALQUERIES'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'select * from PERSONALQUERIES')
    CachedUpdates = True
    Left = 624
    Top = 11
    object QryPersQueryExecID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryPersQueryExecID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryPersQueryExecQRY_NOME: TWideStringField
      FieldName = 'QRY_NOME'
      Size = 60
    end
    object QryPersQueryExecQRY_TEXT: TWideMemoField
      FieldName = 'QRY_TEXT'
      BlobType = ftWideMemo
    end
    object QryPersQueryExecQRY_OBS: TWideMemoField
      FieldName = 'QRY_OBS'
      BlobType = ftWideMemo
    end
    object QryPersQueryExecSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
  end
  object AccessUniProvider1: TAccessUniProvider
    Left = 1024
    Top = 152
  end
  object AdvantageUniProvider1: TAdvantageUniProvider
    Left = 1032
    Top = 208
  end
  object ASEUniProvider1: TASEUniProvider
    Left = 1032
    Top = 256
  end
  object DB2UniProvider1: TDB2UniProvider
    Left = 904
    Top = 56
  end
  object DBFUniProvider1: TDBFUniProvider
    Left = 904
    Top = 208
  end
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 904
    Top = 256
  end
  object MongoDBUniProvider1: TMongoDBUniProvider
    Left = 904
    Top = 152
  end
  object ODBCUniProvider1: TODBCUniProvider
    Left = 904
    Top = 104
  end
  object OracleUniProvider1: TOracleUniProvider
    Left = 1032
    Top = 304
  end
  object PostgreSQLUniProvider1: TPostgreSQLUniProvider
    Left = 904
    Top = 304
  end
  object RedshiftUniProvider1: TRedshiftUniProvider
    Left = 904
    Top = 8
  end
  object CDlgDestino: TUniConnectDialog
    DatabaseLabel = 'Base de dados'
    PortLabel = 'Porta'
    ProviderLabel = 'Fornecedor'
    Caption = 'Iniciar Sess'#227'o Destino'
    UsernameLabel = 'Nome do Usu'#225'rio'
    PasswordLabel = 'Senha'
    ServerLabel = 'Servidor'
    ConnectButton = 'Ok'
    CancelButton = 'Cancelar'
    LabelSet = lsCustom
    Left = 800
    Top = 8
  end
  object UniSQLMonitor1: TUniSQLMonitor
    Active = False
    Left = 336
    Top = 16
  end
  object QryEditor: TUniQuery
    Connection = CcnParametros
    CachedUpdates = True
    Left = 519
    Top = 488
  end
  object DSEditor: TUniDataSource
    DataSet = QryEditor
    Left = 624
    Top = 488
  end
  object QryPersonalFields: TUniQuery
    UpdatingTable = 'PERSONALFIELDS'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO PERSONALFIELDS'
      
        '  (ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, PERSONAL_CAMPO' +
        ', TIPO_CAMPO, ROTINA_SQL)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :TABELA_DESTINO, :TABELA_ORIGEM, :PERSONAL_' +
        'CAMPO, :TIPO_CAMPO, :ROTINA_SQL)')
    SQLDelete.Strings = (
      'DELETE FROM PERSONALFIELDS'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE PERSONALFIELDS'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, TABELA_DESTINO = :TABELA_D' +
        'ESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, PERSONAL_CAMPO = :PERSON' +
        'AL_CAMPO, TIPO_CAMPO = :TIPO_CAMPO, ROTINA_SQL = :ROTINA_SQL'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, PERSONAL_C' +
        'AMPO, TIPO_CAMPO, ROTINA_SQL FROM PERSONALFIELDS'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM PERSONALFIELDS'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'select * from PERSONALFIELDS')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 624
    Top = 120
    object QryPersonalFieldsID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryPersonalFieldsID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryPersonalFieldsTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryPersonalFieldsROTINA_SQL: TWideStringField
      FieldName = 'ROTINA_SQL'
      Size = 1000
    end
    object QryPersonalFieldsPERSONAL_CAMPO: TWideStringField
      FieldName = 'PERSONAL_CAMPO'
      Size = 60
    end
    object QryPersonalFieldsTIPO_CAMPO: TWideStringField
      FieldName = 'TIPO_CAMPO'
      Size = 60
    end
    object QryPersonalFieldsTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
  end
  object QryPERSONALWHERES: TUniQuery
    UpdatingTable = 'PERSONALWHERES'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO PERSONALWHERES'
      
        '  (ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO_WHERE, T' +
        'IPO_CAMPOWHR, ROTINA_SQL, SE_EXISTE, COMPARACOES)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :TABELA_DESTINO, :TABELA_ORIGEM, :CAMPO_WHE' +
        'RE, :TIPO_CAMPOWHR, :ROTINA_SQL, :SE_EXISTE, :COMPARACOES)')
    SQLDelete.Strings = (
      'DELETE FROM PERSONALWHERES'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE PERSONALWHERES'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, TABELA_DESTINO = :TABELA_D' +
        'ESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, CAMPO_WHERE = :CAMPO_WHE' +
        'RE, TIPO_CAMPOWHR = :TIPO_CAMPOWHR, ROTINA_SQL = :ROTINA_SQL, SE' +
        '_EXISTE = :SE_EXISTE, COMPARACOES = :COMPARACOES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO_WHER' +
        'E, TIPO_CAMPOWHR, ROTINA_SQL, SE_EXISTE, COMPARACOES FROM PERSON' +
        'ALWHERES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM PERSONALWHERES'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'SELECT '
      '     ID'
      '   , ID_PROJETO'
      '   , TABELA_DESTINO'
      '   , TABELA_ORIGEM'
      '   , CAMPO_WHERE'
      '   , TIPO_CAMPOWHR'
      '   , ROTINA_SQL'
      '   , SE_EXISTE'
      '   , trim(COMPARACOES) as COMPARACOES'
      
        '   , replace(ROTINA_SQL,CHAR(13)||CHAR(10),'#39#39')|| '#39' '#39'||replace(CO' +
        'MPARACOES,CHAR(13)||CHAR(10),'#39#39')||'#39')'#39' as selectgeral'
      
        '   , replace(ROTINA_SQL,CHAR(13)||CHAR(10),'#39' '#39')||CHAR(13)||CHAR(' +
        '10)||replace(COMPARACOES,CHAR(13)||CHAR(10),'#39#39')||'#39')'#39' as Concatse' +
        'lectgeral  '
      ' FROM '
      '   PERSONALWHERES'
      '  ')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.AdvancedTypeDetection=True'
      'SQLite.FetchAll=True')
    Left = 624
    Top = 168
    object QryPERSONALWHERESID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryPERSONALWHERESID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryPERSONALWHERESTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryPERSONALWHERESROTINA_SQL: TWideStringField
      FieldName = 'ROTINA_SQL'
      Size = 1000
    end
    object QryPERSONALWHERESCAMPO_WHERE: TWideStringField
      FieldName = 'CAMPO_WHERE'
      Size = 60
    end
    object QryPERSONALWHERESTIPO_CAMPOWHR: TWideStringField
      FieldName = 'TIPO_CAMPOWHR'
      Size = 60
    end
    object QryPERSONALWHERESTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object QryPERSONALWHERESSE_EXISTE: TWideStringField
      FieldName = 'SE_EXISTE'
      Size = 1
    end
    object QryPERSONALWHERESselectgeral: TWideMemoField
      FieldName = 'selectgeral'
      BlobType = ftWideMemo
    end
    object QryPERSONALWHERESConcatselectgeral: TWideMemoField
      FieldName = 'Concatselectgeral'
      BlobType = ftWideMemo
    end
    object QryPERSONALWHERESCOMPARACOES: TWideMemoField
      FieldName = 'COMPARACOES'
      BlobType = ftWideMemo
    end
  end
  object QryScript: TUniQuery
    UpdatingTable = 'TABELASCRIPTS'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO TABELASCRIPTS'
      
        '  (ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, TIPO_SCRIPT, S' +
        'CRIPT, SCRIPT_ARQ, DATA_INSERT, RESPONSAVEL_NOME, NOME_ARQUIVO)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :TABELA_DESTINO, :TABELA_ORIGEM, :TIPO_SCRI' +
        'PT, :SCRIPT, :SCRIPT_ARQ, :DATA_INSERT, :RESPONSAVEL_NOME, :NOME' +
        '_ARQUIVO)')
    SQLDelete.Strings = (
      'DELETE FROM TABELASCRIPTS'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE TABELASCRIPTS'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, TABELA_DESTINO = :TABELA_D' +
        'ESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TIPO_SCRIPT = :TIPO_SCRI' +
        'PT, SCRIPT = :SCRIPT, SCRIPT_ARQ = :SCRIPT_ARQ, DATA_INSERT = :D' +
        'ATA_INSERT, RESPONSAVEL_NOME = :RESPONSAVEL_NOME, NOME_ARQUIVO =' +
        ' :NOME_ARQUIVO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, TIPO_SCRIP' +
        'T, SCRIPT, SCRIPT_ARQ, DATA_INSERT, RESPONSAVEL_NOME, NOME_ARQUI' +
        'VO FROM TABELASCRIPTS'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM TABELASCRIPTS'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '   TABELASCRIPTS'
      '    ')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 624
    Top = 216
    object QryScriptID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryScriptID_PROJETO: TIntegerField
      DisplayLabel = 'Id Projeto'
      FieldName = 'ID_PROJETO'
    end
    object QryScriptTIPO_SCRIPT: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_SCRIPT'
      Size = 1
    end
    object QryScriptSCRIPT: TWideMemoField
      DisplayLabel = 'Script'
      FieldName = 'SCRIPT'
      BlobType = ftWideMemo
    end
    object QryScriptSCRIPT_ARQ: TBlobField
      DisplayLabel = 'Arquivo'
      FieldName = 'SCRIPT_ARQ'
    end
    object QryScriptDATA_INSERT: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_INSERT'
    end
    object QryScriptRESPONSAVEL_NOME: TWideStringField
      DisplayLabel = 'Responsavel'
      FieldName = 'RESPONSAVEL_NOME'
      Size = 100
    end
    object QryScriptTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Required = True
      Size = 60
    end
    object QryScriptTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object QryScriptNOME_ARQUIVO: TWideStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 80
    end
  end
  object DS_Script: TUniDataSource
    DataSet = QryScript
    Left = 624
    Top = 272
  end
  object SP_SEQUENCIA: TUniStoredProc
    StoredProcName = 'G_SP_SEQUENCIAS'
    SQL.Strings = (
      'SELECT * FROM G_SP_SEQUENCIAS(:TABELA)')
    Connection = CcnDestino
    CachedUpdates = True
    Left = 182
    Top = 374
    ParamData = <
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
        Size = 30
        Value = nil
      end
      item
        DataType = ftFloat
        Name = 'SEQUENCIA'
        ParamType = ptOutput
        Value = nil
      end>
    CommandStoredProcName = 'G_SP_SEQUENCIAS'
    StoredProcIsQuery = True
    object SP_SEQUENCIASEQUENCIA: TFloatField
      FieldName = 'SEQUENCIA'
    end
  end
  object QryRelationship: TUniQuery
    Connection = CcnDestino
    SQL.Strings = (
      'SELECT'
      '     C.RDB$RELATION_NAME as TABNOME,'
      '     S.RDB$FIELD_NAME AS PRIMARYKEYNAME'
      '    FROM'
      '      RDB$RELATION_CONSTRAINTS C,'
      '      RDB$INDEX_SEGMENTS S,'
      '      RDB$RELATION_FIELDS F'
      '    WHERE'
      '     --  C.RDB$RELATION_NAME = '#39'NomeDaTabela'#39' AND'
      '      C.RDB$CONSTRAINT_TYPE = '#39'PRIMARY KEY'#39' AND'
      '      S.RDB$INDEX_NAME = C.RDB$INDEX_NAME AND'
      '      F.RDB$FIELD_NAME =  S.RDB$FIELD_NAME AND'
      '      F.RDB$RELATION_NAME =   C.RDB$RELATION_NAME AND'
      
        '      F.RDB$FIELD_SOURCE IN ('#39'NUMERICO'#39','#39'NUMERIC'#39','#39'RDB$5545'#39', '#39'R' +
        'DB$5499'#39')')
    Left = 104
    Top = 384
    object QryRelationshipTABNOME: TStringField
      FieldName = 'TABNOME'
      FixedChar = True
      Size = 93
    end
    object QryRelationshipPRIMARYKEYNAME: TStringField
      FieldName = 'PRIMARYKEYNAME'
      ReadOnly = True
      FixedChar = True
      Size = 93
    end
  end
  object MDColunas: TUniMetaData
    MetaDataKind = 'IndexColumns'
    Restrictions.Strings = (
      'TABLE_NAME=C_CAIXA_CHEQUE')
    Connection = CcnDestino
    Left = 752
    Top = 272
  end
  object DataSource1: TDataSource
    DataSet = MDColunas
    Left = 752
    Top = 320
  end
  object QryPersonalQueryLoad: TUniQuery
    UpdatingTable = 'PERSONALQUERIES'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO PERSONALQUERIES'
      '  (ID, ID_PROJETO, SISTEMA, QRY_NOME, QRY_TEXT, QRY_OBS)'
      'VALUES'
      '  (:ID, :ID_PROJETO, :SISTEMA, :QRY_NOME, :QRY_TEXT, :QRY_OBS)')
    SQLDelete.Strings = (
      'DELETE FROM PERSONALQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE PERSONALQUERIES'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, QRY_NO' +
        'ME = :QRY_NOME, QRY_TEXT = :QRY_TEXT, QRY_OBS = :QRY_OBS'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, QRY_NOME, QRY_TEXT, QRY_OBS FROM' +
        ' PERSONALQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM PERSONALQUERIES'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'select * from PERSONALQUERIES ')
    CachedUpdates = True
    Left = 427
    Top = 315
    object QryPersonalQueryLoadID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryPersonalQueryLoadID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryPersonalQueryLoadQRY_NOME: TWideStringField
      FieldName = 'QRY_NOME'
      Size = 60
    end
    object QryPersonalQueryLoadQRY_TEXT: TWideMemoField
      FieldName = 'QRY_TEXT'
      BlobType = ftWideMemo
    end
    object QryPersonalQueryLoadQRY_OBS: TWideMemoField
      FieldName = 'QRY_OBS'
      BlobType = ftWideMemo
    end
    object QryPersonalQueryLoadSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
  end
  object QryScriptLookup1: TUniQuery
    UpdatingTable = 'TABELASCRIPTS'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO TABELASCRIPTS'
      
        '  (ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, TIPO_SCRIPT, S' +
        'CRIPT, SCRIPT_ARQ, DATA_INSERT, RESPONSAVEL_NOME, NOME_ARQUIVO)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :TABELA_DESTINO, :TABELA_ORIGEM, :TIPO_SCRI' +
        'PT, :SCRIPT, :SCRIPT_ARQ, :DATA_INSERT, :RESPONSAVEL_NOME, :NOME' +
        '_ARQUIVO)')
    SQLDelete.Strings = (
      'DELETE FROM TABELASCRIPTS'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE TABELASCRIPTS'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, TABELA_DESTINO = :TABELA_D' +
        'ESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TIPO_SCRIPT = :TIPO_SCRI' +
        'PT, SCRIPT = :SCRIPT, SCRIPT_ARQ = :SCRIPT_ARQ, DATA_INSERT = :D' +
        'ATA_INSERT, RESPONSAVEL_NOME = :RESPONSAVEL_NOME, NOME_ARQUIVO =' +
        ' :NOME_ARQUIVO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, TIPO_SCRIP' +
        'T, SCRIPT, SCRIPT_ARQ, DATA_INSERT, RESPONSAVEL_NOME, NOME_ARQUI' +
        'VO FROM TABELASCRIPTS'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM TABELASCRIPTS'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'SELECT '
      '    cast(0 as integer) AS ID'
      '  , cast(0 as integer) AS ID_PROJETO'
      '  , cast('#39'Todas as Tabelas'#39' as varchar(60)) AS TABELA_DESTINO'
      '  , NULL AS TABELA_ORIGEM'
      '  , NULL AS TIPO_SCRIPT'
      '  , NULL AS SCRIPT'
      '  , NULL AS SCRIPT_ARQ'
      '  , NULL AS DATA_INSERT'
      '  , NULL AS RESPONSAVEL_NOME'
      '  , cast(1 as integer) AS TODAS'
      '  '
      'UNION ALL '
      'SELECT'
      '    ID'
      '  , ID_PROJETO'
      '  , TABELA_DESTINO'
      '  , TABELA_ORIGEM'
      '  , TIPO_SCRIPT'
      '  , SCRIPT'
      '  , SCRIPT_ARQ'
      '  , DATA_INSERT'
      '  , RESPONSAVEL_NOME'
      '  , cast(0 as integer) AS TODAS'
      'FROM'
      '   TABELASCRIPTS'
      ' order by TODAS desc ')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 624
    Top = 320
    object QryScriptLookup1ID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QryScriptLookup1ID_PROJETO: TLargeintField
      FieldName = 'ID_PROJETO'
      ReadOnly = True
    end
    object QryScriptLookup1TABELA_DESTINO: TWideMemoField
      FieldName = 'TABELA_DESTINO'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryScriptLookup1TABELA_ORIGEM: TWideMemoField
      FieldName = 'TABELA_ORIGEM'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryScriptLookup1TIPO_SCRIPT: TWideMemoField
      FieldName = 'TIPO_SCRIPT'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryScriptLookup1SCRIPT: TWideMemoField
      FieldName = 'SCRIPT'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryScriptLookup1SCRIPT_ARQ: TWideMemoField
      FieldName = 'SCRIPT_ARQ'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryScriptLookup1DATA_INSERT: TWideMemoField
      FieldName = 'DATA_INSERT'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryScriptLookup1RESPONSAVEL_NOME: TWideMemoField
      FieldName = 'RESPONSAVEL_NOME'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryScriptLookup1TODAS: TLargeintField
      FieldName = 'TODAS'
      ReadOnly = True
    end
  end
  object DSScriptLookup: TDataSource
    DataSet = QryScriptLookup1
    Left = 519
    Top = 320
  end
  object QryConvGera1: TUniQuery
    Connection = CcnParametros
    SQL.Strings = (
      'SELECT'
      '    cast(0 as integer) as ID'
      '   ,cast('#39'GERAR TODOS SCRIPTS'#39' as varchar(60)) AS SELECAOT'
      '   ,'#39'TODOS'#39' AS TABELA_ORIGEM'
      '   ,'#39'TODOS'#39' AS TABELA_DESTINO'
      '   ,cast(1 as integer) as TODAS'
      '   ,cast(0 as integer) as ordemexec'
      'UNION ALL '
      'select'
      '    max(ID) as ID'
      '   ,(TABELA_ORIGEM||'#39'/'#39'||TABELA_DESTINO) AS SELECAOT '
      '   ,TABELA_ORIGEM'
      '   ,TABELA_DESTINO'
      '   ,cast(0 as integer) as TODAS'
      '   ,cast(max(COALESCE(ORDEM_EXEC,0))as integer) as ordemexec'
      'from '
      '  CONVERSAO'
      '  GROUP by TABELA_ORIGEM'
      '   ,TABELA_DESTINO'
      '  ORDER BY TABELA_DESTINO')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 427
    Top = 368
    object QryConvGera1SELECAOT: TWideMemoField
      FieldName = 'SELECAOT'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryConvGera1TABELA_ORIGEM: TWideMemoField
      FieldName = 'TABELA_ORIGEM'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryConvGera1TABELA_DESTINO: TWideMemoField
      FieldName = 'TABELA_DESTINO'
      ReadOnly = True
      BlobType = ftWideMemo
    end
    object QryConvGera1TODAS: TLargeintField
      FieldName = 'TODAS'
      ReadOnly = True
    end
    object QryConvGera1ID: TLargeintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object QryConvGera1ordemexec: TLargeintField
      FieldName = 'ordemexec'
      ReadOnly = True
    end
  end
  object DSConvGera: TUniDataSource
    DataSet = QryConvGera1
    Left = 519
    Top = 368
  end
  object Qry_ScriptArq: TUniQuery
    UpdatingTable = 'TABELASCRIPTS'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO TABELASCRIPTS'
      
        '  (ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, TIPO_SCRIPT, S' +
        'CRIPT, SCRIPT_ARQ, DATA_INSERT, RESPONSAVEL_NOME, NOME_ARQUIVO)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :TABELA_DESTINO, :TABELA_ORIGEM, :TIPO_SCRI' +
        'PT, :SCRIPT, :SCRIPT_ARQ, :DATA_INSERT, :RESPONSAVEL_NOME, :NOME' +
        '_ARQUIVO)')
    SQLDelete.Strings = (
      'DELETE FROM TABELASCRIPTS'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE TABELASCRIPTS'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, TABELA_DESTINO = :TABELA_D' +
        'ESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TIPO_SCRIPT = :TIPO_SCRI' +
        'PT, SCRIPT = :SCRIPT, SCRIPT_ARQ = :SCRIPT_ARQ, DATA_INSERT = :D' +
        'ATA_INSERT, RESPONSAVEL_NOME = :RESPONSAVEL_NOME, NOME_ARQUIVO =' +
        ' :NOME_ARQUIVO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, TABELA_DESTINO, TABELA_ORIGEM, TIPO_SCRIP' +
        'T, SCRIPT, SCRIPT_ARQ, DATA_INSERT, RESPONSAVEL_NOME, NOME_ARQUI' +
        'VO FROM TABELASCRIPTS'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM TABELASCRIPTS'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '   TABELASCRIPTS'
      '    ')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 624
    Top = 368
    object Qry_ScriptArqID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object Qry_ScriptArqID_PROJETO: TIntegerField
      DisplayLabel = 'Id Projeto'
      FieldName = 'ID_PROJETO'
    end
    object Qry_ScriptArqTIPO_SCRIPT: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_SCRIPT'
      Size = 1
    end
    object Qry_ScriptArqSCRIPT: TWideMemoField
      DisplayLabel = 'Script'
      FieldName = 'SCRIPT'
      BlobType = ftWideMemo
    end
    object Qry_ScriptArqSCRIPT_ARQ: TBlobField
      DisplayLabel = 'Arquivo'
      FieldName = 'SCRIPT_ARQ'
    end
    object Qry_ScriptArqDATA_INSERT: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATA_INSERT'
    end
    object Qry_ScriptArqRESPONSAVEL_NOME: TWideStringField
      DisplayLabel = 'Responsavel'
      FieldName = 'RESPONSAVEL_NOME'
      Size = 100
    end
    object Qry_ScriptArqTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Required = True
      Size = 60
    end
    object Qry_ScriptArqTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object Qry_ScriptArqNOME_ARQUIVO: TWideStringField
      FieldName = 'NOME_ARQUIVO'
      Size = 80
    end
  end
  object DS_ScriptArq: TUniDataSource
    DataSet = Qry_ScriptArq
    Left = 624
    Top = 424
  end
  object QryMontaPrSelect: TUniQuery
    Connection = CcnDestino
    Left = 928
    Top = 432
  end
  object DSPERSONALWHERES: TUniDataSource
    DataSet = QryPERSONALWHERES
    Left = 520
    Top = 600
  end
  object QrySelectTable: TUniQuery
    Connection = CcnOrigem
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 40
    Top = 384
  end
  object QryInsertTable: TUniQuery
    UpdatingTable = 'teste'
    KeyFields = 'idteste'
    Connection = CcnDestino
    CachedUpdates = True
    Options.StrictUpdate = False
    Left = 928
    Top = 480
  end
  object DSPersonalFields: TUniDataSource
    DataSet = QryPersonalFields
    Left = 680
    Top = 600
  end
  object QryGeral: TUniQuery
    Connection = CcnOrigem
    BeforeOpen = QryGeralBeforeOpen
    Left = 1016
    Top = 432
  end
  object QryGeralExec: TUniQuery
    Connection = CcnDestino
    SQL.Strings = (
      ' '
      ' execute block '
      ' as  '
      ' begin '
      
        ' IF (NOT EXISTS(SELECT 1 AS RESULT from RDB$RELATION_FIELDS RF W' +
        'HERE rf.RDB$RELATION_NAME = '#39'V_CASAMENTO'#39' AND RF.RDB$FIELD_NAME ' +
        '= '#39'HASHCOD'#39')) THEN EXECUTE STATEMENT '#39'ALTER TABLE  V_CASAMENTO A' +
        'DD HASHCOD VARCHAR(70)'#39';'
      'END;'
      '')
    BeforeExecute = QryGeralExecBeforeExecute
    Left = 1024
    Top = 480
  end
  object QryParamWhr: TUniQuery
    UpdatingTable = 'CONVERSAO'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO CONVERSAO'
      
        '  (ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_DESTI' +
        'NO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, IDX_C' +
        'AMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO, TIP' +
        'ODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO, TAM' +
        '_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, PERS' +
        'ONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COMO_WH' +
        'ERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, CONVE' +
        'TER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EXEC, ' +
        'SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT, DE' +
        'FAULT_VALOR)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :SISTEMA, :SISTEMAID, :BANCO_ORIGEM, :BANCO' +
        '_DESTINO, :TABELA_ORIGEM, :TABELA_DESTINO, :CHAVE_PRIMARIA_DESTI' +
        'NO, :IDX_CAMPO_ORIGEM, :IDX_CAMPO_DESTINO, :CAMPO_ORIGEM, :CAMPO' +
        '_DESTINO, :TIPODADO_ORIGEM, :TIPODADO_DESTINO, :VALOR_ORIGEM, :V' +
        'ALOR_DESTINO, :TAM_CAMPO_ORIGEM, :TAM_CAMPO_DESTINO, :ACEITA_NUL' +
        'L, :GERAR_VALOR, :PERSONAL_SELECT, :PERS_SELECT_WHERE, :CARACTER' +
        'ES_REMOVER, :USAR_COMO_WHERE, :TIPOVALOR_GERAR, :VALOR_A_CONSIDE' +
        'RAR, :RETIRAR_ACENTOS, :CONVETER_MAIUSCULO, :AJUSTAR_TAMANHO, :F' +
        'ILTRAR_CARACTERES, :ORDEM_EXEC, :SEQUENCIA, :CHAVE_PRIMARIA_ORIG' +
        'EM, :TCAMPO, :COMPORCHAVEDEFAULT, :DEFAULT_VALOR)')
    SQLDelete.Strings = (
      'DELETE FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE CONVERSAO'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, SISTEM' +
        'AID = :SISTEMAID, BANCO_ORIGEM = :BANCO_ORIGEM, BANCO_DESTINO = ' +
        ':BANCO_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TABELA_DESTINO =' +
        ' :TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO = :CHAVE_PRIMARIA_DESTI' +
        'NO, IDX_CAMPO_ORIGEM = :IDX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO = :I' +
        'DX_CAMPO_DESTINO, CAMPO_ORIGEM = :CAMPO_ORIGEM, CAMPO_DESTINO = ' +
        ':CAMPO_DESTINO, TIPODADO_ORIGEM = :TIPODADO_ORIGEM, TIPODADO_DES' +
        'TINO = :TIPODADO_DESTINO, VALOR_ORIGEM = :VALOR_ORIGEM, VALOR_DE' +
        'STINO = :VALOR_DESTINO, TAM_CAMPO_ORIGEM = :TAM_CAMPO_ORIGEM, TA' +
        'M_CAMPO_DESTINO = :TAM_CAMPO_DESTINO, ACEITA_NULL = :ACEITA_NULL' +
        ', GERAR_VALOR = :GERAR_VALOR, PERSONAL_SELECT = :PERSONAL_SELECT' +
        ', PERS_SELECT_WHERE = :PERS_SELECT_WHERE, CARACTERES_REMOVER = :' +
        'CARACTERES_REMOVER, USAR_COMO_WHERE = :USAR_COMO_WHERE, TIPOVALO' +
        'R_GERAR = :TIPOVALOR_GERAR, VALOR_A_CONSIDERAR = :VALOR_A_CONSID' +
        'ERAR, RETIRAR_ACENTOS = :RETIRAR_ACENTOS, CONVETER_MAIUSCULO = :' +
        'CONVETER_MAIUSCULO, AJUSTAR_TAMANHO = :AJUSTAR_TAMANHO, FILTRAR_' +
        'CARACTERES = :FILTRAR_CARACTERES, ORDEM_EXEC = :ORDEM_EXEC, SEQU' +
        'ENCIA = :SEQUENCIA, CHAVE_PRIMARIA_ORIGEM = :CHAVE_PRIMARIA_ORIG' +
        'EM, TCAMPO = :TCAMPO, COMPORCHAVEDEFAULT = :COMPORCHAVEDEFAULT, ' +
        'DEFAULT_VALOR = :DEFAULT_VALOR'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_D' +
        'ESTINO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, I' +
        'DX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO,' +
        ' TIPODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO,' +
        ' TAM_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, ' +
        'PERSONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COM' +
        'O_WHERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, C' +
        'ONVETER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EX' +
        'EC, SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT' +
        ', DEFAULT_VALOR FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM CONVERSAO'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select'
      '  * '
      'from '
      '   CONVERSAO'
      ' ')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 427
    Top = 419
    object QryParamWhrID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryParamWhrTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Size = 60
    end
    object QryParamWhrTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryParamWhrCAMPO_ORIGEM: TWideStringField
      FieldName = 'CAMPO_ORIGEM'
      Size = 60
    end
    object QryParamWhrTIPODADO_ORIGEM: TWideStringField
      FieldName = 'TIPODADO_ORIGEM'
      Size = 30
    end
    object QryParamWhrTIPODADO_DESTINO: TWideStringField
      FieldName = 'TIPODADO_DESTINO'
      Size = 30
    end
    object QryParamWhrVALOR_ORIGEM: TWideMemoField
      FieldName = 'VALOR_ORIGEM'
      BlobType = ftWideMemo
    end
    object QryParamWhrVALOR_DESTINO: TWideMemoField
      FieldName = 'VALOR_DESTINO'
      BlobType = ftWideMemo
    end
    object QryParamWhrTAM_CAMPO_ORIGEM: TIntegerField
      FieldName = 'TAM_CAMPO_ORIGEM'
    end
    object QryParamWhrTAM_CAMPO_DESTINO: TIntegerField
      FieldName = 'TAM_CAMPO_DESTINO'
    end
    object QryParamWhrBANCO_ORIGEM: TWideStringField
      FieldName = 'BANCO_ORIGEM'
      Size = 60
    end
    object QryParamWhrBANCO_DESTINO: TWideStringField
      FieldName = 'BANCO_DESTINO'
      Size = 60
    end
    object QryParamWhrCAMPO_DESTINO: TWideStringField
      FieldName = 'CAMPO_DESTINO'
      Size = 60
    end
    object QryParamWhrSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
    object QryParamWhrID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryParamWhrSISTEMAID: TIntegerField
      FieldName = 'SISTEMAID'
    end
    object QryParamWhrACEITA_NULL: TBooleanField
      FieldName = 'ACEITA_NULL'
    end
    object QryParamWhrGERAR_VALOR: TBooleanField
      FieldName = 'GERAR_VALOR'
    end
    object QryParamWhrTIPOVALOR_GERAR: TIntegerField
      FieldName = 'TIPOVALOR_GERAR'
    end
    object QryParamWhrVALOR_A_CONSIDERAR: TIntegerField
      FieldName = 'VALOR_A_CONSIDERAR'
    end
    object QryParamWhrIDX_CAMPO_ORIGEM: TIntegerField
      FieldName = 'IDX_CAMPO_ORIGEM'
    end
    object QryParamWhrIDX_CAMPO_DESTINO: TIntegerField
      FieldName = 'IDX_CAMPO_DESTINO'
    end
    object QryParamWhrPERSONAL_SELECT: TWideMemoField
      FieldName = 'PERSONAL_SELECT'
      BlobType = ftWideMemo
    end
    object QryParamWhrUSAR_COMO_WHERE: TBooleanField
      FieldName = 'USAR_COMO_WHERE'
    end
    object QryParamWhrCARACTERES_REMOVER: TWideStringField
      FieldName = 'CARACTERES_REMOVER'
      Size = 50
    end
    object QryParamWhrRETIRAR_ACENTOS: TBooleanField
      FieldName = 'RETIRAR_ACENTOS'
    end
    object QryParamWhrCONVETER_MAIUSCULO: TBooleanField
      FieldName = 'CONVETER_MAIUSCULO'
    end
    object QryParamWhrFILTRAR_CARACTERES: TIntegerField
      FieldName = 'FILTRAR_CARACTERES'
    end
    object QryParamWhrAJUSTAR_TAMANHO: TBooleanField
      FieldName = 'AJUSTAR_TAMANHO'
    end
    object QryParamWhrCHAVE_PRIMARIA_DESTINO: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_DESTINO'
      Size = 60
    end
    object QryParamWhrPERS_SELECT_WHERE: TWideMemoField
      FieldName = 'PERS_SELECT_WHERE'
      BlobType = ftWideMemo
    end
    object QryParamWhrORDEM_EXEC: TIntegerField
      FieldName = 'ORDEM_EXEC'
    end
    object QryParamWhrSEQUENCIA: TWideStringField
      FieldName = 'SEQUENCIA'
      Size = 60
    end
    object QryParamWhrCHAVE_PRIMARIA_ORIGEM: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_ORIGEM'
      Size = 60
    end
    object QryParamWhrTCAMPO: TWideStringField
      FieldName = 'TCAMPO'
      Size = 3
    end
    object QryParamWhrCOMPORCHAVEDEFAULT: TBooleanField
      FieldName = 'COMPORCHAVEDEFAULT'
    end
    object QryParamWhrDEFAULT_VALOR: TWideStringField
      FieldName = 'DEFAULT_VALOR'
      Size = 300
    end
    object QryParamWhrRTFTOTEXT: TBooleanField
      FieldName = 'RTFTOTEXT'
    end
  end
  object TblInsert3: TUniTable
    Connection = CcnDestino
    FilterSQL = '1 = 0'
    CachedUpdates = True
    Options.PrepareUpdateSQL = True
    Options.DefaultValues = True
    Left = 848
    Top = 480
  end
  object UniScript1: TUniScript
    SQL.Strings = (
      ''
      'ALTER TABLE CONVERSAO ADD COLUMN SEQUENCIA VARCHAR(60) ')
    Connection = CcnParametros
    Left = 808
    Top = 592
  end
  object QryOrdena: TUniQuery
    Connection = CcnParametros
    SQL.Strings = (
      'select '
      '    max(COALESCE(ORDEM_EXEC,0)) as ORDEM_EXEC'
      '   ,TABELA_ORIGEM'
      '   ,TABELA_DESTINO'
      '   ,CAST(0 AS BOOLEAN) as MARCADO'
      '   '
      'from '
      '  CONVERSAO'
      '  GROUP by TABELA_ORIGEM ,TABELA_DESTINO'
      '  ORDER BY ORDEM_EXEC')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.AdvancedTypeDetection=True'
      'SQLite.FetchAll=True')
    Left = 424
    Top = 536
    object QryOrdenaTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object QryOrdenaTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Required = True
      Size = 60
    end
    object QryOrdenaMARCADO: TLargeintField
      FieldName = 'MARCADO'
    end
    object QryOrdenaORDEM_EXEC: TLargeintField
      FieldName = 'ORDEM_EXEC'
      ReadOnly = True
    end
  end
  object DSOrdena: TUniDataSource
    DataSet = QryOrdena
    Left = 519
    Top = 424
  end
  object DSExecuteparam: TUniDataSource
    DataSet = QryExecuteparam
    Left = 424
    Top = 480
  end
  object QryChecaSeq: TUniQuery
    Connection = CcnParametros
    SQL.Strings = (
      'select'
      '  CV.SEQUENCIA'
      '  ,CV.GERAR_VALOR'
      '  ,CV.TIPOVALOR_GERAR'
      '  ,VALOR_A_CONSIDERAR'
      'from'
      'CONVERSAO CV'
      'WHERE '
      ' CV.GERAR_VALOR > 0 '
      ' and CV.TIPOVALOR_GERAR = 4')
    Left = 424
    Top = 592
    object QryChecaSeqSEQUENCIA: TWideStringField
      FieldName = 'SEQUENCIA'
      Size = 60
    end
    object QryChecaSeqGERAR_VALOR: TBooleanField
      FieldName = 'GERAR_VALOR'
      Required = True
    end
    object QryChecaSeqTIPOVALOR_GERAR: TIntegerField
      FieldName = 'TIPOVALOR_GERAR'
    end
    object QryChecaSeqVALOR_A_CONSIDERAR: TIntegerField
      FieldName = 'VALOR_A_CONSIDERAR'
    end
  end
  object QryParams: TUniQuery
    Connection = CcnDestino
    SQL.Strings = (
      ':teste')
    Left = 624
    Top = 544
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'teste'
        Value = nil
      end>
  end
  object Qryconvfield: TUniQuery
    UpdatingTable = 'CONVERSAO'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO CONVERSAO'
      
        '  (ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_DESTI' +
        'NO, TABELA_ORIGEM, TABELA_DESTINO, IDX_CAMPO_ORIGEM, IDX_CAMPO_D' +
        'ESTINO, CAMPO_ORIGEM, CAMPO_DESTINO, TIPODADO_ORIGEM, TIPODADO_D' +
        'ESTINO, VALOR_ORIGEM, VALOR_DESTINO, TAM_CAMPO_ORIGEM, TAM_CAMPO' +
        '_DESTINO, ACEITA_NULL, GERAR_VALOR, PERSONAL_SELECT, CARACTERES_' +
        'REMOVER, USAR_COMO_WHERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, R' +
        'ETIRAR_ACENTOS, CONVETER_MAIUSCULO, FILTRAR_CARACTERES)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :SISTEMA, :SISTEMAID, :BANCO_ORIGEM, :BANCO' +
        '_DESTINO, :TABELA_ORIGEM, :TABELA_DESTINO, :IDX_CAMPO_ORIGEM, :I' +
        'DX_CAMPO_DESTINO, :CAMPO_ORIGEM, :CAMPO_DESTINO, :TIPODADO_ORIGE' +
        'M, :TIPODADO_DESTINO, :VALOR_ORIGEM, :VALOR_DESTINO, :TAM_CAMPO_' +
        'ORIGEM, :TAM_CAMPO_DESTINO, :ACEITA_NULL, :GERAR_VALOR, :PERSONA' +
        'L_SELECT, :CARACTERES_REMOVER, :USAR_COMO_WHERE, :TIPOVALOR_GERA' +
        'R, :VALOR_A_CONSIDERAR, :RETIRAR_ACENTOS, :CONVETER_MAIUSCULO, :' +
        'FILTRAR_CARACTERES)')
    SQLDelete.Strings = (
      'DELETE FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE CONVERSAO'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, SISTEM' +
        'AID = :SISTEMAID, BANCO_ORIGEM = :BANCO_ORIGEM, BANCO_DESTINO = ' +
        ':BANCO_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TABELA_DESTINO =' +
        ' :TABELA_DESTINO, IDX_CAMPO_ORIGEM = :IDX_CAMPO_ORIGEM, IDX_CAMP' +
        'O_DESTINO = :IDX_CAMPO_DESTINO, CAMPO_ORIGEM = :CAMPO_ORIGEM, CA' +
        'MPO_DESTINO = :CAMPO_DESTINO, TIPODADO_ORIGEM = :TIPODADO_ORIGEM' +
        ', TIPODADO_DESTINO = :TIPODADO_DESTINO, VALOR_ORIGEM = :VALOR_OR' +
        'IGEM, VALOR_DESTINO = :VALOR_DESTINO, TAM_CAMPO_ORIGEM = :TAM_CA' +
        'MPO_ORIGEM, TAM_CAMPO_DESTINO = :TAM_CAMPO_DESTINO, ACEITA_NULL ' +
        '= :ACEITA_NULL, GERAR_VALOR = :GERAR_VALOR, PERSONAL_SELECT = :P' +
        'ERSONAL_SELECT, CARACTERES_REMOVER = :CARACTERES_REMOVER, USAR_C' +
        'OMO_WHERE = :USAR_COMO_WHERE, TIPOVALOR_GERAR = :TIPOVALOR_GERAR' +
        ', VALOR_A_CONSIDERAR = :VALOR_A_CONSIDERAR, RETIRAR_ACENTOS = :R' +
        'ETIRAR_ACENTOS, CONVETER_MAIUSCULO = :CONVETER_MAIUSCULO, FILTRA' +
        'R_CARACTERES = :FILTRAR_CARACTERES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_D' +
        'ESTINO, TABELA_ORIGEM, TABELA_DESTINO, IDX_CAMPO_ORIGEM, IDX_CAM' +
        'PO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO, TIPODADO_ORIGEM, TIPODA' +
        'DO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO, TAM_CAMPO_ORIGEM, TAM_C' +
        'AMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, PERSONAL_SELECT, CARACTE' +
        'RES_REMOVER, USAR_COMO_WHERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERA' +
        'R, RETIRAR_ACENTOS, CONVETER_MAIUSCULO, FILTRAR_CARACTERES FROM ' +
        'CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM CONVERSAO'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select'
      '  * '
      'from '
      '   CONVERSAO'
      ' ')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True')
    Left = 519
    Top = 544
    object QryconvfieldID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryconvfieldTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Size = 60
    end
    object QryconvfieldTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryconvfieldCAMPO_ORIGEM: TWideStringField
      FieldName = 'CAMPO_ORIGEM'
      Size = 60
    end
    object QryconvfieldTIPODADO_ORIGEM: TWideStringField
      FieldName = 'TIPODADO_ORIGEM'
      Size = 30
    end
    object QryconvfieldTIPODADO_DESTINO: TWideStringField
      FieldName = 'TIPODADO_DESTINO'
      Size = 30
    end
    object QryconvfieldVALOR_ORIGEM: TWideMemoField
      FieldName = 'VALOR_ORIGEM'
      BlobType = ftWideMemo
    end
    object QryconvfieldVALOR_DESTINO: TWideMemoField
      FieldName = 'VALOR_DESTINO'
      BlobType = ftWideMemo
    end
    object QryconvfieldTAM_CAMPO_ORIGEM: TIntegerField
      FieldName = 'TAM_CAMPO_ORIGEM'
    end
    object QryconvfieldTAM_CAMPO_DESTINO: TIntegerField
      FieldName = 'TAM_CAMPO_DESTINO'
    end
    object QryconvfieldBANCO_ORIGEM: TWideStringField
      FieldName = 'BANCO_ORIGEM'
      Size = 60
    end
    object QryconvfieldBANCO_DESTINO: TWideStringField
      FieldName = 'BANCO_DESTINO'
      Size = 60
    end
    object QryconvfieldCAMPO_DESTINO: TWideStringField
      FieldName = 'CAMPO_DESTINO'
      Size = 60
    end
    object QryconvfieldSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
    object QryconvfieldID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryconvfieldSISTEMAID: TIntegerField
      FieldName = 'SISTEMAID'
    end
    object QryconvfieldACEITA_NULL: TBooleanField
      FieldName = 'ACEITA_NULL'
    end
    object QryconvfieldGERAR_VALOR: TBooleanField
      FieldName = 'GERAR_VALOR'
    end
    object QryconvfieldTIPOVALOR_GERAR: TIntegerField
      FieldName = 'TIPOVALOR_GERAR'
    end
    object QryconvfieldVALOR_A_CONSIDERAR: TIntegerField
      FieldName = 'VALOR_A_CONSIDERAR'
    end
    object QryconvfieldIDX_CAMPO_ORIGEM: TIntegerField
      FieldName = 'IDX_CAMPO_ORIGEM'
    end
    object QryconvfieldIDX_CAMPO_DESTINO: TIntegerField
      FieldName = 'IDX_CAMPO_DESTINO'
    end
    object QryconvfieldPERSONAL_SELECT: TWideMemoField
      FieldName = 'PERSONAL_SELECT'
      BlobType = ftWideMemo
    end
    object QryconvfieldUSAR_COMO_WHERE: TBooleanField
      FieldName = 'USAR_COMO_WHERE'
    end
    object QryconvfieldCARACTERES_REMOVER: TWideStringField
      FieldName = 'CARACTERES_REMOVER'
      Size = 50
    end
    object QryconvfieldRETIRAR_ACENTOS: TBooleanField
      FieldName = 'RETIRAR_ACENTOS'
    end
    object QryconvfieldCONVETER_MAIUSCULO: TBooleanField
      FieldName = 'CONVETER_MAIUSCULO'
    end
    object QryconvfieldFILTRAR_CARACTERES: TIntegerField
      FieldName = 'FILTRAR_CARACTERES'
    end
    object QryconvfieldAJUSTAR_TAMANHO: TBooleanField
      FieldName = 'AJUSTAR_TAMANHO'
    end
    object QryconvfieldCHAVE_PRIMARIA_DESTINO: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_DESTINO'
      Size = 60
    end
    object QryconvfieldPERS_SELECT_WHERE: TWideMemoField
      FieldName = 'PERS_SELECT_WHERE'
      BlobType = ftWideMemo
    end
    object QryconvfieldORDEM_EXEC: TIntegerField
      FieldName = 'ORDEM_EXEC'
    end
    object QryconvfieldSEQUENCIA: TWideStringField
      FieldName = 'SEQUENCIA'
      Size = 60
    end
    object QryconvfieldCHAVE_PRIMARIA_ORIGEM: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_ORIGEM'
      Size = 60
    end
    object QryconvfieldTCAMPO: TWideStringField
      FieldName = 'TCAMPO'
      Size = 3
    end
    object QryconvfieldCOMPORCHAVEDEFAULT: TBooleanField
      FieldName = 'COMPORCHAVEDEFAULT'
    end
    object QryconvfieldDEFAULT_VALOR: TWideStringField
      FieldName = 'DEFAULT_VALOR'
      Size = 300
    end
  end
  object execsql: TUniSQL
    Connection = CcnDestino
    Left = 816
    Top = 416
  end
  object scrExecute: TUniScript
    SQL.Strings = (
      ''
      'ALTER TABLE CONVERSAO ADD COLUMN SEQUENCIA VARCHAR(60) ')
    Connection = CcnParametros
    Left = 784
    Top = 528
  end
  object QryParametroEdit: TUniQuery
    UpdatingTable = 'CONVERSAO'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO CONVERSAO'
      
        '  (ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_DESTI' +
        'NO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, IDX_C' +
        'AMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO, TIP' +
        'ODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO, TAM' +
        '_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, PERS' +
        'ONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COMO_WH' +
        'ERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, CONVE' +
        'TER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EXEC, ' +
        'SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT, DE' +
        'FAULT_VALOR, RTFTOTEXT)'
      'VALUES'
      
        '  (:ID, :ID_PROJETO, :SISTEMA, :SISTEMAID, :BANCO_ORIGEM, :BANCO' +
        '_DESTINO, :TABELA_ORIGEM, :TABELA_DESTINO, :CHAVE_PRIMARIA_DESTI' +
        'NO, :IDX_CAMPO_ORIGEM, :IDX_CAMPO_DESTINO, :CAMPO_ORIGEM, :CAMPO' +
        '_DESTINO, :TIPODADO_ORIGEM, :TIPODADO_DESTINO, :VALOR_ORIGEM, :V' +
        'ALOR_DESTINO, :TAM_CAMPO_ORIGEM, :TAM_CAMPO_DESTINO, :ACEITA_NUL' +
        'L, :GERAR_VALOR, :PERSONAL_SELECT, :PERS_SELECT_WHERE, :CARACTER' +
        'ES_REMOVER, :USAR_COMO_WHERE, :TIPOVALOR_GERAR, :VALOR_A_CONSIDE' +
        'RAR, :RETIRAR_ACENTOS, :CONVETER_MAIUSCULO, :AJUSTAR_TAMANHO, :F' +
        'ILTRAR_CARACTERES, :ORDEM_EXEC, :SEQUENCIA, :CHAVE_PRIMARIA_ORIG' +
        'EM, :TCAMPO, :COMPORCHAVEDEFAULT, :DEFAULT_VALOR, :RTFTOTEXT)')
    SQLDelete.Strings = (
      'DELETE FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE CONVERSAO'
      'SET'
      
        '  ID = :ID, ID_PROJETO = :ID_PROJETO, SISTEMA = :SISTEMA, SISTEM' +
        'AID = :SISTEMAID, BANCO_ORIGEM = :BANCO_ORIGEM, BANCO_DESTINO = ' +
        ':BANCO_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, TABELA_DESTINO =' +
        ' :TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO = :CHAVE_PRIMARIA_DESTI' +
        'NO, IDX_CAMPO_ORIGEM = :IDX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO = :I' +
        'DX_CAMPO_DESTINO, CAMPO_ORIGEM = :CAMPO_ORIGEM, CAMPO_DESTINO = ' +
        ':CAMPO_DESTINO, TIPODADO_ORIGEM = :TIPODADO_ORIGEM, TIPODADO_DES' +
        'TINO = :TIPODADO_DESTINO, VALOR_ORIGEM = :VALOR_ORIGEM, VALOR_DE' +
        'STINO = :VALOR_DESTINO, TAM_CAMPO_ORIGEM = :TAM_CAMPO_ORIGEM, TA' +
        'M_CAMPO_DESTINO = :TAM_CAMPO_DESTINO, ACEITA_NULL = :ACEITA_NULL' +
        ', GERAR_VALOR = :GERAR_VALOR, PERSONAL_SELECT = :PERSONAL_SELECT' +
        ', PERS_SELECT_WHERE = :PERS_SELECT_WHERE, CARACTERES_REMOVER = :' +
        'CARACTERES_REMOVER, USAR_COMO_WHERE = :USAR_COMO_WHERE, TIPOVALO' +
        'R_GERAR = :TIPOVALOR_GERAR, VALOR_A_CONSIDERAR = :VALOR_A_CONSID' +
        'ERAR, RETIRAR_ACENTOS = :RETIRAR_ACENTOS, CONVETER_MAIUSCULO = :' +
        'CONVETER_MAIUSCULO, AJUSTAR_TAMANHO = :AJUSTAR_TAMANHO, FILTRAR_' +
        'CARACTERES = :FILTRAR_CARACTERES, ORDEM_EXEC = :ORDEM_EXEC, SEQU' +
        'ENCIA = :SEQUENCIA, CHAVE_PRIMARIA_ORIGEM = :CHAVE_PRIMARIA_ORIG' +
        'EM, TCAMPO = :TCAMPO, COMPORCHAVEDEFAULT = :COMPORCHAVEDEFAULT, ' +
        'DEFAULT_VALOR = :DEFAULT_VALOR, RTFTOTEXT = :RTFTOTEXT'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_PROJETO, SISTEMA, SISTEMAID, BANCO_ORIGEM, BANCO_D' +
        'ESTINO, TABELA_ORIGEM, TABELA_DESTINO, CHAVE_PRIMARIA_DESTINO, I' +
        'DX_CAMPO_ORIGEM, IDX_CAMPO_DESTINO, CAMPO_ORIGEM, CAMPO_DESTINO,' +
        ' TIPODADO_ORIGEM, TIPODADO_DESTINO, VALOR_ORIGEM, VALOR_DESTINO,' +
        ' TAM_CAMPO_ORIGEM, TAM_CAMPO_DESTINO, ACEITA_NULL, GERAR_VALOR, ' +
        'PERSONAL_SELECT, PERS_SELECT_WHERE, CARACTERES_REMOVER, USAR_COM' +
        'O_WHERE, TIPOVALOR_GERAR, VALOR_A_CONSIDERAR, RETIRAR_ACENTOS, C' +
        'ONVETER_MAIUSCULO, AJUSTAR_TAMANHO, FILTRAR_CARACTERES, ORDEM_EX' +
        'EC, SEQUENCIA, CHAVE_PRIMARIA_ORIGEM, TCAMPO, COMPORCHAVEDEFAULT' +
        ', DEFAULT_VALOR, RTFTOTEXT FROM CONVERSAO'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM CONVERSAO'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select'
      '  CV.*'
      '  ,PF.ROTINA_SQL AS _SQL'
      'from '
      '   CONVERSAO CV'
      
        ' Left Join PERSONALFIELDS PF ON CV.TABELA_DESTINO = PF.TABELA_DE' +
        'STINO AND CV.TABELA_ORIGEM = PF.TABELA_ORIGEM AND PF.PERSONAL_CA' +
        'MPO = CAMPO_DESTINO'
      ' order by BANCO_DESTINO,TABELA_DESTINO')
    CachedUpdates = True
    SpecificOptions.Strings = (
      'SQLite.FetchAll=True'
      'SQLite.AdvancedTypeDetection=True')
    Left = 683
    Top = 483
    object QryParametroEditID: TIntegerField
      Alignment = taLeftJustify
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QryParametroEditTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Size = 60
    end
    object QryParametroEditTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Size = 60
    end
    object QryParametroEditCAMPO_ORIGEM: TWideStringField
      FieldName = 'CAMPO_ORIGEM'
      Size = 60
    end
    object QryParametroEditTIPODADO_ORIGEM: TWideStringField
      FieldName = 'TIPODADO_ORIGEM'
      Size = 30
    end
    object QryParametroEditTIPODADO_DESTINO: TWideStringField
      FieldName = 'TIPODADO_DESTINO'
      Size = 30
    end
    object QryParametroEditVALOR_ORIGEM: TWideMemoField
      FieldName = 'VALOR_ORIGEM'
      BlobType = ftWideMemo
    end
    object QryParametroEditVALOR_DESTINO: TWideMemoField
      FieldName = 'VALOR_DESTINO'
      BlobType = ftWideMemo
    end
    object QryParametroEditTAM_CAMPO_ORIGEM: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'TAM_CAMPO_ORIGEM'
    end
    object QryParametroEditTAM_CAMPO_DESTINO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'TAM_CAMPO_DESTINO'
    end
    object QryParametroEditBANCO_ORIGEM: TWideStringField
      FieldName = 'BANCO_ORIGEM'
      Size = 60
    end
    object QryParametroEditBANCO_DESTINO: TWideStringField
      FieldName = 'BANCO_DESTINO'
      Size = 60
    end
    object QryParametroEditCAMPO_DESTINO: TWideStringField
      FieldName = 'CAMPO_DESTINO'
      Size = 60
    end
    object QryParametroEditSISTEMA: TWideStringField
      FieldName = 'SISTEMA'
      Size = 60
    end
    object QryParametroEditID_PROJETO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID_PROJETO'
    end
    object QryParametroEditSISTEMAID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'SISTEMAID'
    end
    object QryParametroEditACEITA_NULL: TBooleanField
      FieldName = 'ACEITA_NULL'
    end
    object QryParametroEditGERAR_VALOR: TBooleanField
      FieldName = 'GERAR_VALOR'
    end
    object QryParametroEditTIPOVALOR_GERAR: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'TIPOVALOR_GERAR'
    end
    object QryParametroEditVALOR_A_CONSIDERAR: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'VALOR_A_CONSIDERAR'
    end
    object QryParametroEditIDX_CAMPO_ORIGEM: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'IDX_CAMPO_ORIGEM'
    end
    object QryParametroEditIDX_CAMPO_DESTINO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'IDX_CAMPO_DESTINO'
    end
    object QryParametroEditPERSONAL_SELECT: TWideMemoField
      FieldName = 'PERSONAL_SELECT'
      BlobType = ftWideMemo
    end
    object QryParametroEditUSAR_COMO_WHERE: TBooleanField
      FieldName = 'USAR_COMO_WHERE'
    end
    object QryParametroEditCARACTERES_REMOVER: TWideStringField
      FieldName = 'CARACTERES_REMOVER'
      Size = 50
    end
    object QryParametroEdit_SQL: TWideStringField
      FieldName = '_SQL'
      Size = 1000
    end
    object QryParametroEditRETIRAR_ACENTOS: TBooleanField
      FieldName = 'RETIRAR_ACENTOS'
    end
    object QryParametroEditCONVETER_MAIUSCULO: TBooleanField
      FieldName = 'CONVETER_MAIUSCULO'
    end
    object QryParametroEditFILTRAR_CARACTERES: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FILTRAR_CARACTERES'
    end
    object QryParametroEditAJUSTAR_TAMANHO: TBooleanField
      FieldName = 'AJUSTAR_TAMANHO'
    end
    object QryParametroEditCHAVE_PRIMARIA_DESTINO: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_DESTINO'
      Size = 60
    end
    object QryParametroEditORDEM_EXEC: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ORDEM_EXEC'
    end
    object QryParametroEditPERS_SELECT_WHERE: TWideMemoField
      FieldName = 'PERS_SELECT_WHERE'
      BlobType = ftWideMemo
    end
    object QryParametroEditSEQUENCIA: TWideStringField
      FieldName = 'SEQUENCIA'
      Size = 60
    end
    object QryParametroEditCHAVE_PRIMARIA_ORIGEM: TWideStringField
      FieldName = 'CHAVE_PRIMARIA_ORIGEM'
      Size = 60
    end
    object QryParametroEditTCAMPO: TWideStringField
      FieldName = 'TCAMPO'
      Size = 3
    end
    object QryParametroEditCOMPORCHAVEDEFAULT: TBooleanField
      FieldName = 'COMPORCHAVEDEFAULT'
    end
    object QryParametroEditDEFAULT_VALOR: TWideStringField
      FieldName = 'DEFAULT_VALOR'
      Size = 300
    end
    object QryParametroEditRTFTOTEXT: TBooleanField
      FieldName = 'RTFTOTEXT'
    end
  end
  object DSParametroEdit: TUniDataSource
    DataSet = QryParametroEdit
    Left = 683
    Top = 539
  end
  object MdSelector: TUniMetaData
    Filtered = True
    Filter = 'TABLE_TYPE in ( '#39'TABLE'#39' , '#39'VIEW'#39')'
    MetaDataKind = 'Tables'
    Connection = CcnParametros
    Left = 155
    Top = 554
  end
  object DSSubstQueriesins: TUniDataSource
    DataSet = QrySubstView
    Left = 280
    Top = 536
  end
  object QrySubstView: TUniQuery
    UpdatingTable = 'SUBSTQUERIES'
    KeyFields = 'ID'
    SQLInsert.Strings = (
      'INSERT INTO SUBSTQUERIES'
      
        '  (ID, ID_CONVERSAO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO, TIPO_' +
        'CAMPO, VALOR_ORIGEM, VALOR_DESTINO, ROTINA_SQL, REFERENTE)'
      'VALUES'
      
        '  (:ID, :ID_CONVERSAO, :TABELA_DESTINO, :TABELA_ORIGEM, :CAMPO, ' +
        ':TIPO_CAMPO, :VALOR_ORIGEM, :VALOR_DESTINO, :ROTINA_SQL, :REFERE' +
        'NTE)')
    SQLDelete.Strings = (
      'DELETE FROM SUBSTQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE SUBSTQUERIES'
      'SET'
      
        '  ID = :ID, ID_CONVERSAO = :ID_CONVERSAO, TABELA_DESTINO = :TABE' +
        'LA_DESTINO, TABELA_ORIGEM = :TABELA_ORIGEM, CAMPO = :CAMPO, TIPO' +
        '_CAMPO = :TIPO_CAMPO, VALOR_ORIGEM = :VALOR_ORIGEM, VALOR_DESTIN' +
        'O = :VALOR_DESTINO, ROTINA_SQL = :ROTINA_SQL, REFERENTE = :REFER' +
        'ENTE'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, ID_CONVERSAO, TABELA_DESTINO, TABELA_ORIGEM, CAMPO, T' +
        'IPO_CAMPO, VALOR_ORIGEM, VALOR_DESTINO, ROTINA_SQL, REFERENTE FR' +
        'OM SUBSTQUERIES'
      'WHERE'
      '  ID = :Old_ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM SUBSTQUERIES'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'Select '
      '  *'
      ' from '
      '   SUBSTQUERIES'
      ' where'
      '   ID_CONVERSAO = :ID'
      ' ')
    MasterSource = DSQryParametros
    CachedUpdates = True
    Left = 279
    Top = 587
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
    object QrySubstViewID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object QrySubstViewID_CONVERSAO: TIntegerField
      FieldName = 'ID_CONVERSAO'
    end
    object QrySubstViewVALOR_ORIGEM: TWideStringField
      FieldName = 'VALOR_ORIGEM'
      Size = 60
    end
    object QrySubstViewVALOR_DESTINO: TWideStringField
      FieldName = 'VALOR_DESTINO'
      Size = 60
    end
    object QrySubstViewROTINA_SQL: TWideMemoField
      FieldName = 'ROTINA_SQL'
      BlobType = ftWideMemo
    end
    object QrySubstViewCAMPO: TWideStringField
      FieldName = 'CAMPO'
      Size = 60
    end
    object QrySubstViewTIPO_CAMPO: TWideStringField
      FieldName = 'TIPO_CAMPO'
      Size = 60
    end
    object QrySubstViewTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Required = True
      Size = 60
    end
    object QrySubstViewTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object QrySubstViewREFERENTE: TWideStringField
      FieldName = 'REFERENTE'
      Size = 1
    end
  end
  object UniQuery1: TUniQuery
    Connection = CcnOrigem
    SQL.Strings = (
      'select * from geral')
    Left = 56
    Top = 456
  end
  object QryC_ORDEM: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO CONVERSAO_ORDEM'
      
        '  (ID, TABELA_ORIGEM, TABELA_DESTINO, ORDEM_EXEC, ID_PROJETO, OR' +
        'IGEM_G_CHAVE)'
      'VALUES'
      
        '  (:ID, :TABELA_ORIGEM, :TABELA_DESTINO, :ORDEM_EXEC, :ID_PROJET' +
        'O, :ORIGEM_G_CHAVE)')
    SQLDelete.Strings = (
      'DELETE FROM CONVERSAO_ORDEM'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE CONVERSAO_ORDEM'
      'SET'
      
        '  ID = :ID, TABELA_ORIGEM = :TABELA_ORIGEM, TABELA_DESTINO = :TA' +
        'BELA_DESTINO, ORDEM_EXEC = :ORDEM_EXEC, ID_PROJETO = :ID_PROJETO' +
        ', ORIGEM_G_CHAVE = :ORIGEM_G_CHAVE'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT ID, TABELA_ORIGEM, TABELA_DESTINO, ORDEM_EXEC, ID_PROJETO' +
        ', ORIGEM_G_CHAVE FROM CONVERSAO_ORDEM'
      'WHERE'
      '  ID = :ID')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM (SELECT * FROM CONVERSAO_ORDEM'
      ')')
    Connection = CcnParametros
    SQL.Strings = (
      'SELECT '
      '  ID,'
      '  TABELA_ORIGEM,'
      '  TABELA_DESTINO,'
      '  ORDEM_EXEC,'
      '  ID_PROJETO,'
      '  ORIGEM_G_CHAVE'
      'FROM '
      '  CONVERSAO_ORDEM')
    Left = 328
    Top = 480
    object QryC_ORDEMID: TIntegerField
      FieldName = 'ID'
    end
    object QryC_ORDEMTABELA_ORIGEM: TWideStringField
      FieldName = 'TABELA_ORIGEM'
      Required = True
      Size = 60
    end
    object QryC_ORDEMTABELA_DESTINO: TWideStringField
      FieldName = 'TABELA_DESTINO'
      Required = True
      Size = 60
    end
    object QryC_ORDEMORDEM_EXEC: TIntegerField
      FieldName = 'ORDEM_EXEC'
    end
    object QryC_ORDEMID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
    end
    object QryC_ORDEMORIGEM_G_CHAVE: TWideMemoField
      FieldName = 'ORIGEM_G_CHAVE'
      BlobType = ftWideMemo
    end
  end
end
