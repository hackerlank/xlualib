--[=======[
-------- -------- -------- --------
                xlog����
-------- -------- -------- --------
]=======]

--[=======[
��
    void      xlog            ( ... );  --���������debugview               [-?, +0, -]
        --ע�⣬����ڼ���ǰ�˺�����Ԥ���壬��ʹ��Ԥ����

    void      dbgview         ( ... );  --���������debugview               [-?, +0, -]
        --�˺���������xlog���滻������£�����ѡ�������debugview
]=======]

--[=======[
��
    string    xlog_level;
        --"off"       --�������
        --"fatal"     --�������󣬳����޷�����ִ��
        --"error"     --��ӳ��������һЩAPI�ĵ���ʧ��
        --"warn"      --��ӳĳЩ��Ҫע��Ŀ�����Ǳ��Σ�յ���������ܻ���ɱ������߼�����֮��
        --"info"      --��ʾ������̵���Ϣ
        --"debug"     --��ͨ�ĵ�����Ϣ��������Ϣ����ʱһ�㲻���
        --"trace"     --�ϸ�ĵ�����Ϣ�������ڶ�λ���󣬲鿴ĳЩ������ֵ
        --"on"        --ȫ���
]=======]
xlog_level = "on";

local function chk_lvl()
  local lvl = xlog_level:lower();
  if lvl == "off" then
    return 0;
  elseif lvl == "fatal" then
    return 1;
  elseif lvl == "error" then
    return 2;
  elseif lvl == "warn" then
    return 3;
  elseif lvl == "info" then
    return 4;
  elseif lvl == "debug" then
    return 5;
  elseif lvl == "trace" then
    return 6;
  --else if lvl == "on" then
  end
  return 7;
end
--[=======[
��
    --����xlog_level�Ķ�̬���Եȼ��������Ƿ������Ϣ
    --������ײ����xlog�����Ϣ���޸�xlog������ʵ����Ϣת��
    void      xfail           ( ... );                                      [-?, +0, -]
    void      xerr            ( ... );                                      [-?, +0, -]
    void      xwarn           ( ... );                                      [-?, +0, -]
    void      xinfo           ( ... );                                      [-?, +0, -]
    void      xdbg            ( ... );                                      [-?, +0, -]
    void      xtrace          ( ... );                                      [-?, +0, -]
]=======]
function xfail(...)
  if chk_lvl() < 1 then    return;   end
  return xlog(...);
end
function xerr(...)
  if chk_lvl() < 2 then    return;   end
  return xlog(...);
end
function xwarn(...)
  if chk_lvl() < 3 then    return;   end
  return xlog(...);
end
function xinfo(...)
  if chk_lvl() < 4 then    return;   end
  return xlog(...);
end
function xdbg(...)
  if chk_lvl() < 5 then    return;   end
  return xlog(...);
end
function xtrace(...)
  if chk_lvl() < 6 then    return;   end
  return xlog(...);
end

--[=======[
��
    --����Ϣ������������string��
    void      stirng:xlog     ( ... );                                      [-?, +0, -]
    void      stirng:xfail    ( ... );                                      [-?, +0, -]
    void      string:xerr     ( ... );                                      [-?, +0, -]
    void      string:xwarn    ( ... );                                      [-?, +0, -]
    void      string:xinfo    ( ... );                                      [-?, +0, -]
    void      string:xdbg     ( ... );                                      [-?, +0, -]
    void      string:xtrace   ( ... );                                      [-?, +0, -]
]=======]
string.xlog           = function( ... ) return xlog                        ( ... ); end
string.xfail          = function( ... ) return xfail                       ( ... ); end
string.xerr           = function( ... ) return xerr                        ( ... ); end
string.xwarn          = function( ... ) return xwarn                       ( ... ); end
string.xinfo          = function( ... ) return xinfo                       ( ... ); end
string.xdbg           = function( ... ) return xdbg                        ( ... ); end
string.xtrace         = function( ... ) return xtrace                      ( ... ); end