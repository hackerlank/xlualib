--[=======[
-------- -------- -------- --------
          serialcomm����
-------- -------- -------- --------
]=======]

--[=======[
��
    string[]  serialcomm.gets           ( );                                [-0, +1, v]
        --��ȡ����ͨѶ���б�
        --���ر����£�
          {
          string serialcomm_1 ( "COM#" ),
          string serialcomm_2,
          ...
          }

    SerailComm serialcomm.raw_open      ( string SerialCommName );        [-1, +1, c|v]
        --ָ���������ƣ��򿪴���
        --���ش򿪳ɹ��Ĵ��ڶ���
        --�˺���Ϊԭʼ�򿪣���δ��¼�Ѵ򿪵Ĵ��ڶ����޷�ͨ��serialcomm.close�Զ��ͷţ�����ʹ��serialcomm.open����
]=======]

--[=======[
��
    SerialComm[] serialcomm.opened;
        --����ʹ��serialcomm.open�򿪵Ĵ��ڶ����Ա��ѯ��ͨ��serialcomm.close�Զ��ͷ�
        --���Ŵ˱���Ϊ�˷����ѯ���û�����ֹ�޸Ĵ˱��������serialcomm.close�޷��Զ��ͷ������Ѵ򿪵Ĵ��ڶ���
        --���ʽ��ʾ��{ SerailComm, SerailComm, ... };
        ex:
            for k, v in pairs(serialcomm.opened) do
              xlog(k ,v);
            end
]=======]

local opened = {};

serialcomm.opened = setmetatable(
  {},
  {
  __index = opened;
  __pairs = function( t )
    return next, opened, nil;
  end;
  __newindex = function()
    return error( "serialcomm.opened forbid modify!" );
  end;
  }
  );
--[=======[
    SerailComm serialcomm.open          ( string SerialCommName );        [-1, +1, c|v]
        --ָ���������ƣ��򿪴��ڣ�ͬʱ�����Ѿ��򿪵Ķ�������serialcomm.opened
        --ʹ�ô˺����򿪵Ĵ��ڶ������ʹ��serialcomm.close�Զ��ͷ�
]=======]
function serialcomm.open( name )
  local sc = serialcomm.raw_open( name );
  opened[#opened + 1] = sc;
  return sc;
end
--[=======[
    void      serialcomm.close          ( );                                [-0, +0, c]
        --�ͷű�serialcomm.opened�����е�SerialComm������ձ�
]=======]
function serialcomm.close( )
  for k, v in pairs(opened) do
    v:close();
  end
  opened = {};
end
--[=======[
��
    private:  SerialComm;
    ���º���Ϊ���ڶ����������
    δ���ر�˵������£����ڶ������ʧ�ܣ����׳��쳣��ͬʱ!!�ͷŴ��ڶ���!!

    string    SerialComm:__tostring     ( );                                [-0, +1, c]
        --������ڶ�����Ϣ
        --��Ϣ��ʽ��ʾ��"SerialComm [COM#] (Closed & N/A | Invalid | ####)"

    void      SerialComm:__gc           ( );                                [-0, +0, c]
        --���ڶ����ͷ�
        --������ڶ�����Ч������true�����򷵻�false

    bool      SerialComm:close          ( );                                [-0, +0, c]
        --ͬSerialComm:__gc�����������ͷŴ��ڶ���

    int       SerialComm:baudrate       ( [int newvalue] );             [-0|1, +1, c|v]
        --��ָ��newvalueʱ�����ô��ڶ���BaudRate��ͬʱ���ؾ�ֵ
        --δָ��newvalueʱ���������ص�ǰBaudRate
        --���¼�������ͬ��
    int       SerialComm:bytesize       ( [int newvalue] );             [-0|1, +1, c|v]
    int       SerialComm:stopbits       ( [int newvalue] );             [-0|1, +1, c|v]
    int       SerialComm:parity         ( [int newvalue] );             [-0|1, +1, c|v]

    int       SerialComm:write          ( string data );                  [-1, +1, c|v]
        --ָ��д�����ݵ����ڶ��󣬷���д�������ֽ���
        --��֤��ָ������ȫ��д�봮�ڶ���

    string    SerialComm:read           ( );                              [-0, +1, c|v]
        --�Ӵ��ڶ����ȡ����
        --������������ݣ����ؿմ�

    HANDLE    SerialComm:handle         ( );      --���ش��ڶ�����        [-0, +1, c]

    bool      SerialComm:isopen         ( );      --��⴮����Ч��          [-0, +1, c]

    string    SerialComm:name           ( );      --���ش������ƣ��磺"COM#"[-0, +1, c]

    string    SerialComm:type           ( );      --���ش�������"SerialComm"[-0, +1, c]
]=======]

