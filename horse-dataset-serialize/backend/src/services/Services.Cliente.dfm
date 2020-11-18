object ServiceCliente: TServiceCliente
  OldCreateOrder = False
  Height = 150
  Width = 366
  object Connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Projetos\Git\mateus-vicente\public\mobile-day\horse-' +
        'dataset-serialize\database\database.db'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auDesignTime]
    LoginPrompt = False
    Left = 80
    Top = 56
  end
  object qryCadastro: TFDQuery
    CachedUpdates = True
    Connection = Connection
    SQL.Strings = (
      'select c.id, c.nome, c.sobrenome, c.email'
      'from clientes c')
    Left = 160
    Top = 56
    object qryCadastroid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryCadastronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryCadastrosobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Size = 100
    end
    object qryCadastroemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
  end
  object qryPesquisa: TFDQuery
    Connection = Connection
    SQL.Strings = (
      'select c.id, c.nome, c.sobrenome, c.email'
      'from clientes c')
    Left = 240
    Top = 56
    object qryPesquisaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qryPesquisanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object qryPesquisasobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Size = 100
    end
    object qryPesquisaemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
  end
end
