object dmConsultas: TdmConsultas
  Height = 151
  Width = 439
  object dsPostgres: TDataSource
    DataSet = cdsPostgres
    Left = 48
    Top = 40
  end
  object cdsPostgres: TClientDataSet
    PersistDataPacket.Data = {
      230100009619E0BD01000000180000000700000000000300000023010963645F
      636C69666F72040001000200000011766C5F756E69746172696F5F6D6564696F
      080004000200010007535542545950450200490006004D6F6E6579000E766C5F
      746F74616C5F6D6564696F080004000200010007535542545950450200490006
      004D6F6E6579000E766C5F73756273745F6D6564696F08000400020001000753
      5542545950450200490006004D6F6E6579001071745F76656E646964615F6D65
      64696108000400020000000C766C5F6970695F6D6564696F0800040002000100
      07535542545950450200490006004D6F6E65790014766C5F69636D735F6E6F72
      6D616C5F6D6564696F080004000200010007535542545950450200490006004D
      6F6E6579000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'cd_clifor'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'vl_unitario_medio'
        Attributes = [faReadonly]
        DataType = ftCurrency
      end
      item
        Name = 'vl_total_medio'
        Attributes = [faReadonly]
        DataType = ftCurrency
      end
      item
        Name = 'vl_subst_medio'
        Attributes = [faReadonly]
        DataType = ftCurrency
      end
      item
        Name = 'qt_vendida_media'
        Attributes = [faReadonly]
        DataType = ftFloat
      end
      item
        Name = 'vl_ipi_medio'
        Attributes = [faReadonly]
        DataType = ftCurrency
      end
      item
        Name = 'vl_icms_normal_medio'
        Attributes = [faReadonly]
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 128
    Top = 40
    object cdsPostgrescd_clifor: TIntegerField
      DisplayLabel = 'Cliente/Fornecedor'
      FieldName = 'cd_clifor'
      ReadOnly = True
    end
    object cdsPostgresvl_unitario_medio: TCurrencyField
      DisplayLabel = 'Vl. Unit. M'#233'dio'
      FieldName = 'vl_unitario_medio'
      ReadOnly = True
    end
    object cdsPostgresvl_total_medio: TCurrencyField
      DisplayLabel = 'Vl. Total M'#233'dio'
      FieldName = 'vl_total_medio'
      ReadOnly = True
    end
    object cdsPostgresvl_subst_medio: TCurrencyField
      DisplayLabel = 'Vl. Subst. M'#233'dio'
      FieldName = 'vl_subst_medio'
      ReadOnly = True
    end
    object cdsPostgresqt_vendida_media: TFloatField
      DisplayLabel = 'Qtde. M'#233'dia Vendida'
      FieldName = 'qt_vendida_media'
      ReadOnly = True
    end
    object cdsPostgresvl_ipi_medio: TCurrencyField
      DisplayLabel = 'Vl. IPI M'#233'dio'
      FieldName = 'vl_ipi_medio'
      ReadOnly = True
    end
    object cdsPostgresvl_icms_normal_medio: TCurrencyField
      DisplayLabel = 'Vl. ICMS Normal M'#233'dio'
      FieldName = 'vl_icms_normal_medio'
      ReadOnly = True
    end
  end
end
