object ServiceCliente: TServiceCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 259
  object mtCadastro: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 56
    object mtCadastroid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtCadastronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object mtCadastrosobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Size = 100
    end
    object mtCadastroemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
  end
  object mtPesquisa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 56
    object mtPesquisaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object mtPesquisanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object mtPesquisasobrenome: TStringField
      FieldName = 'sobrenome'
      Origin = 'sobrenome'
      Size = 100
    end
    object mtPesquisaemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 200
    end
  end
end
