object dmConsultas: TdmConsultas
  Height = 219
  Width = 350
  object dsConsultaPostgres: TDataSource
    DataSet = cdsConsultaPostgres
    Left = 56
    Top = 24
  end
  object cdsConsultaPostgres: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 176
    Top = 24
  end
end
