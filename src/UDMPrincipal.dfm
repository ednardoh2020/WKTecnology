object DM: TDM
  OldCreateOrder = False
  Height = 421
  Width = 344
  object DBConexao: TFDConnection
    Params.Strings = (
      'Database=dbpedido_venda'
      'User_Name=root'
      'Password=1234'
      'Server=localhost'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    LoginPrompt = False
    Left = 77
    Top = 25
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 72
    Top = 80
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 80
    Top = 152
  end
end
