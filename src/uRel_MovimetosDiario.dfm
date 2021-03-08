object frmRel_Vendas: TfrmRel_Vendas
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas diaria'
  ClientHeight = 170
  ClientWidth = 482
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 121
    Width = 482
    Height = 49
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 104
    ExplicitWidth = 468
    object btn_gerar: TButton
      Left = 107
      Top = 7
      Width = 105
      Height = 33
      Caption = 'Gerar'
      TabOrder = 0
      OnClick = btn_gerarClick
    end
    object Button2: TButton
      Left = 251
      Top = 6
      Width = 105
      Height = 33
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 121
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 468
    ExplicitHeight = 104
    object Label1: TLabel
      Left = 231
      Top = 68
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Label2: TLabel
      Left = 125
      Top = 47
      Width = 36
      Height = 13
      Caption = 'Periodo'
    end
    object edt_DtINI: TMaskEdit
      Left = 125
      Top = 67
      Width = 96
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnKeyPress = edt_DtINIKeyPress
    end
    object edt_DtFIN: TMaskEdit
      Left = 245
      Top = 67
      Width = 96
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
      OnKeyPress = edt_DtFINKeyPress
    end
    object RLP_Vendas: TRLReport
      Left = 0
      Top = 528
      Width = 1123
      Height = 794
      DataSource = ds_Relvendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      PageSetup.Orientation = poLandscape
      object RLBand1: TRLBand
        Left = 38
        Top = 38
        Width = 1047
        Height = 148
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Borders.FixedLeft = True
        Borders.FixedRight = True
        object RLDBText11: TRLDBText
          Left = 151
          Top = 12
          Width = 751
          Height = 18
          Alignment = taCenter
          AutoSize = False
          DataField = 'NOME_FANTASIA'
          DataSource = ds_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLLabel4: TRLLabel
          Left = 5
          Top = 117
          Width = 46
          Height = 16
          Caption = 'Tanque'
        end
        object RLLabel5: TRLLabel
          Left = 152
          Top = 117
          Width = 72
          Height = 16
          Caption = 'Data Venda'
        end
        object RLLabel6: TRLLabel
          Left = 245
          Top = 117
          Width = 45
          Height = 16
          Caption = 'Bomba'
        end
        object RLLabel7: TRLLabel
          Left = 317
          Top = 117
          Width = 80
          Height = 16
          Caption = 'C'#243'd. Produto'
        end
        object RLLabel8: TRLLabel
          Left = 412
          Top = 117
          Width = 161
          Height = 16
          Caption = 'Descri'#231#227'o do Produto'
        end
        object RLLabel9: TRLLabel
          Left = 653
          Top = 117
          Width = 57
          Height = 16
          Caption = 'Operador'
        end
        object RLLabel10: TRLLabel
          Left = 719
          Top = 117
          Width = 37
          Height = 16
          Caption = 'Caixa'
        end
        object RLLabel11: TRLLabel
          Left = 800
          Top = 117
          Width = 72
          Height = 16
          Caption = 'Forma Pgto'
        end
        object RLLabel12: TRLLabel
          Left = 944
          Top = 117
          Width = 100
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor Total'
        end
        object RLDraw3: TRLDraw
          Left = 0
          Top = 111
          Width = 1045
          Height = 1
        end
        object RLDraw4: TRLDraw
          Left = 1
          Top = 136
          Width = 1045
          Height = 1
        end
        object RLLabel13: TRLLabel
          Left = 65
          Top = 117
          Width = 72
          Height = 16
          Caption = 'C'#243'd. Venda'
        end
        object RLLabel1: TRLLabel
          Left = 152
          Top = 81
          Width = 750
          Height = 19
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio de vendas di'#225'ria por periodo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 953
          Top = 12
          Width = 39
          Height = 16
          Text = ''
        end
        object RLLabel14: TRLLabel
          Left = 908
          Top = 13
          Width = 39
          Height = 15
          Alignment = taRightJustify
          Caption = 'Data :'
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 953
          Top = 36
          Width = 87
          Height = 16
          Info = itPageNumber
          Text = ''
        end
        object RLLabel15: TRLLabel
          Left = 888
          Top = 36
          Width = 59
          Height = 16
          Alignment = taRightJustify
          Caption = 'P'#225'gina :'
        end
        object RLDBText12: TRLDBText
          Left = 152
          Top = 38
          Width = 750
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'ENDERECO'
          DataSource = ds_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDBText13: TRLDBText
          Left = 150
          Top = 58
          Width = 752
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'TELEFONE'
          DataSource = ds_empresa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDBImage1: TRLDBImage
          Left = 4
          Top = 6
          Width = 133
          Height = 105
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          DataField = 'LOGOMARCA'
          DataSource = ds_empresa
          Stretch = True
        end
      end
      object RLGroup1: TRLGroup
        Left = 38
        Top = 186
        Width = 1047
        Height = 34
        DataFields = 'TIPO_COMBUSTIVEL'
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 1047
          Height = 33
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = False
          Borders.DrawRight = True
          Borders.DrawBottom = False
          Borders.FixedLeft = True
          Borders.FixedRight = True
          object RLDBText1: TRLDBText
            Left = 308
            Top = 18
            Width = 92
            Height = 16
            DataField = 'CD_PRODUTO'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 406
            Top = 18
            Width = 161
            Height = 16
            DataField = 'DESCRICAO_PROD'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 150
            Top = 18
            Width = 73
            Height = 16
            DataField = 'DT_MOVVENDAS'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 233
            Top = 18
            Width = 73
            Height = 16
            DataField = 'DS_BOMBA'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 636
            Top = 18
            Width = 75
            Height = 16
            DataField = 'DS_OPERADOR'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText8: TRLDBText
            Left = 714
            Top = 18
            Width = 66
            Height = 16
            DataField = 'DS_CAIXA'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText9: TRLDBText
            Left = 800
            Top = 18
            Width = 89
            Height = 16
            DataField = 'DS_FPGTO'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 944
            Top = 18
            Width = 100
            Height = 16
            Alignment = taRightJustify
            DataField = 'VALOR_VENDA'
            DataSource = ds_Relvendas
            Text = ''
          end
          object RLDBText10: TRLDBText
            Left = 65
            Top = 18
            Width = 85
            Height = 16
            DataField = 'CD_MOVVENDAS'
            DataSource = ds_Relvendas
            Text = ''
          end
        end
        object RLDBText3: TRLDBText
          Left = 8
          Top = 1
          Width = 53
          Height = 16
          DataField = 'CD_TANQUE'
          DataSource = ds_Relvendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
        object RLDBText14: TRLDBText
          Left = 67
          Top = 1
          Width = 58
          Height = 16
          DataField = 'TIPO_COMBUSTIVEL'
          DataSource = ds_Relvendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 220
        Width = 1047
        Height = 27
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = False
        Borders.FixedLeft = True
        Borders.FixedRight = True
        object RLDBResult1: TRLDBResult
          Left = 928
          Top = 8
          Width = 116
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_VENDA'
          DataSource = ds_Relvendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
          Text = ''
        end
        object RLDraw1: TRLDraw
          Left = 776
          Top = 3
          Width = 269
          Height = 1
        end
        object RLLabel2: TRLLabel
          Left = 800
          Top = 6
          Width = 61
          Height = 16
          Caption = 'SUb Total'
        end
      end
      object RLBand4: TRLBand
        Left = 38
        Top = 247
        Width = 1047
        Height = 34
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Borders.FixedLeft = True
        Borders.FixedRight = True
        object RLDraw2: TRLDraw
          Left = 780
          Top = 8
          Width = 264
          Height = 1
        end
        object RLDBResult2: TRLDBResult
          Left = 929
          Top = 11
          Width = 116
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_VENDA'
          DataSource = ds_Relvendas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 800
          Top = 14
          Width = 67
          Height = 16
          Caption = 'Total Geral'
        end
      end
    end
  end
  object Qry_RelVendas: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'select mv.cd_movvendas,'
      '       mv.cd_produto,'
      '        pr.ds_reduzido_produto as descricao_prod,'
      '        mv.dt_movvendas,'
      '        mv.cd_tanque,'
      '        ta.tp_combustivel as tipo_combustivel,'
      '        mv.cd_bomba,'
      '        bo.ds_bomba,'
      '        mv.cd_operador,'
      '        op.ds_operador,'
      '        mv.cd_caixa,'
      '        cx.ds_caixa,'
      '        mv.cd_fpgto,'
      '        pg.ds_fpgto,'
      '        mv.ds_historico,'
      '        mv.valor_venda,'
      '        mv.desconto,'
      '        mv.troco,'
      '        mv.qtd_prod,'
      '        mv.prc_prod,'
      '        mv.valor_imposto'
      'from tb_movimentacao_vendas mv'
      '     inner join tb_produtos pr on mv.cd_produto = pr.cd_produto'
      '     inner join tb_tanque ta on mv.cd_tanque = ta.cd_tanque'
      '     inner join tb_bomba bo on mv.cd_bomba = bo.cd_bomba'
      
        '     inner join tb_operador op on mv.cd_operador = op.cd_operado' +
        'r'
      '     inner join tb_caixa cx on mv.cd_caixa = cx.cd_caixa'
      '     inner join tb_fpgto pg on mv.cd_fpgto = pg.cd_fpgto'
      'where mv.dt_movvendas between '#39'13.02.2021'#39' and '#39'14.02.2021'#39
      'order by mv.dt_movvendas,mv.cd_tanque,mv.cd_bomba')
    Left = 368
    object Qry_RelVendasCD_MOVVENDAS: TStringField
      FieldName = 'CD_MOVVENDAS'
      Origin = 'CD_MOVVENDAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object Qry_RelVendasCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'CD_PRODUTO'
      Required = True
      Size = 13
    end
    object Qry_RelVendasDESCRICAO_PROD: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_PROD'
      Origin = 'DS_REDUZIDO_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object Qry_RelVendasDT_MOVVENDAS: TDateField
      FieldName = 'DT_MOVVENDAS'
      Origin = 'DT_MOVVENDAS'
    end
    object Qry_RelVendasCD_TANQUE: TStringField
      FieldName = 'CD_TANQUE'
      Origin = 'CD_TANQUE'
      Size = 10
    end
    object Qry_RelVendasTIPO_COMBUSTIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_COMBUSTIVEL'
      Origin = 'TP_COMBUSTIVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object Qry_RelVendasCD_BOMBA: TStringField
      FieldName = 'CD_BOMBA'
      Origin = 'CD_BOMBA'
      Size = 10
    end
    object Qry_RelVendasDS_BOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_BOMBA'
      Origin = 'DS_BOMBA'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object Qry_RelVendasCD_OPERADOR: TStringField
      FieldName = 'CD_OPERADOR'
      Origin = 'CD_OPERADOR'
      Size = 10
    end
    object Qry_RelVendasDS_OPERADOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_OPERADOR'
      Origin = 'DS_OPERADOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object Qry_RelVendasCD_CAIXA: TStringField
      FieldName = 'CD_CAIXA'
      Origin = 'CD_CAIXA'
      Size = 10
    end
    object Qry_RelVendasDS_CAIXA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_CAIXA'
      Origin = 'DS_CAIXA'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object Qry_RelVendasCD_FPGTO: TStringField
      FieldName = 'CD_FPGTO'
      Origin = 'CD_FPGTO'
      Size = 10
    end
    object Qry_RelVendasDS_FPGTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DS_FPGTO'
      Origin = 'DS_FPGTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object Qry_RelVendasDS_HISTORICO: TStringField
      FieldName = 'DS_HISTORICO'
      Origin = 'DS_HISTORICO'
      Size = 100
    end
    object Qry_RelVendasVALOR_VENDA: TBCDField
      FieldName = 'VALOR_VENDA'
      Origin = 'VALOR_VENDA'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object Qry_RelVendasDESCONTO: TBCDField
      FieldName = 'DESCONTO'
      Origin = 'DESCONTO'
      EditFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object Qry_RelVendasTROCO: TBCDField
      FieldName = 'TROCO'
      Origin = 'TROCO'
      EditFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object Qry_RelVendasQTD_PROD: TBCDField
      FieldName = 'QTD_PROD'
      Origin = 'QTD_PROD'
      EditFormat = ',0.00'
      Precision = 18
    end
    object Qry_RelVendasPRC_PROD: TBCDField
      FieldName = 'PRC_PROD'
      Origin = 'PRC_PROD'
      EditFormat = ',0.00'
      Precision = 18
    end
    object Qry_RelVendasVALOR_IMPOSTO: TBCDField
      FieldName = 'VALOR_IMPOSTO'
      Origin = 'VALOR_IMPOSTO'
      EditFormat = ',0.00'
      Precision = 18
    end
  end
  object ds_Relvendas: TDataSource
    DataSet = Qry_RelVendas
    Left = 400
  end
  object Qry_Empresa: TFDQuery
    Connection = DM.DBConexao
    SQL.Strings = (
      'SELECT * FROM TB_EMPRESA')
    Left = 480
    Top = 8
    object Qry_EmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 30
    end
    object Qry_EmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 100
    end
    object Qry_EmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object Qry_EmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object Qry_EmpresaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object Qry_EmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 30
    end
    object Qry_EmpresaIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
    end
    object Qry_EmpresaLOGOMARCA: TBlobField
      FieldName = 'LOGOMARCA'
      Origin = 'LOGOMARCA'
    end
  end
  object ds_empresa: TDataSource
    DataSet = Qry_Empresa
    Left = 536
    Top = 8
  end
end
