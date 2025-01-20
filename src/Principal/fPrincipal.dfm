object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 519
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnDestroy = FormDestroy
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 519
    Align = alClient
    TabOrder = 0
    object grdConsultas: TDBGrid
      Left = 1
      Top = 248
      Width = 774
      Height = 270
      Align = alBottom
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object btnConectar: TButton
      Left = 8
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Conectar'
      TabOrder = 1
      OnClick = btnConectarClick
    end
    object btnConsultar: TButton
      Left = 104
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btnConsultarClick
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 680
    Top = 56
  end
end
