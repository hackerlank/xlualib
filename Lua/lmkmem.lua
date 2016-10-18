--[=======[
-------- -------- -------- --------
            mem����
-------- -------- -------- --------

����ָ����interger��ʽ���䣬�����ǲ���light userdata��ʽ���ǿ���ָ�����㣬��ʽ������ȱ���
]=======]

--[=======[
��
    string [, string errmsg]
              readmem         ( void* lpmem, size_t size );               [-2, +1|2, c]
                                                --��ȡָ���ڴ�λ��ָ����������
                                                --����ָ���ڴ�λ���Ƿ���Ч�����쳣�׳�
                                                --��ȡʧ�ܷ��ؿմ�, ������Ϣ
    bool [, string errmsg]
              writemem        ( void* lpmem, string writebytes );         [-2, +1|2, c]
                                                --д��ָ���ڴ�λ��ָ����������
                                                --����ָ���ڴ�λ���Ƿ���Ч�����쳣�׳�
                                                --дʧ�ܷ���false, ������Ϣ
    unsigned char*
              newmem          ( size_t size );                              [-1, +1, c]
                                                --ָ���ֽڴ�С�������ڴ�
                                                --�ɹ��򷵻��ڴ�ָ��
                                                --size == 0��ʧ���򷵻�nullptr
    bool      deletemem       ( unsigned char* lpmem );                     [-1, +1, c]
                                                --�ͷ���newmem������ڴ�
    
    --���º�����Ҫ5.3�����ϵ�string.unpack֧�֡��Ͱ汾�������޸�Դ�����֮
    int|bool [, string]
              mkb             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���byteֵ��С��
    int|bool [, string]
              mkB             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���byteֵ��С��
    int|bool [, string]
              mkbb            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���byteֵ�����
    int|bool [, string]
              mkBB            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���byteֵ�����

    int|bool [, string]
              mkw             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���wordֵ��С��
    int|bool [, string]
              mkW             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���wordֵ��С��
    int|bool [, string]
              mkww            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���wordֵ�����
    int|bool [, string]
              mkWW            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���wordֵ�����
                                                
    int|bool [, string]
              mkd             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���dwordֵ��С��
    int|bool [, string]
              mkD             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���dwordֵ��С��
    int|bool [, string]
              mkdd            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���dwordֵ�����
    int|bool [, string]
              mkDD            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���dwordֵ�����
    
    int|bool [, string]
              mkq             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���qwordֵ��С��
    int|bool [, string]
              mkQ             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���qwordֵ��С��
    int|bool [, string]
              mkqq            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�з���qwordֵ�����
    int|bool [, string]
              mkQQ            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/д�޷���qwordֵ�����
    
    float|bool [, string]
              mkf             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/дfloatֵ��С��
    double|bool [, string]
              mkF             ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/дdoubleֵ��С��
    float|bool [, string]
              mkff            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/дfloatֵ�����
    double|bool [, string]
              mkFF            ( void* lpmem [, int value] );          [-1|2, +1|2, c|e]
                                                --��/дdoubleֵ�����
                                                
    int       bswap           ( int value [, int size] );                 [-1|2, +1, c]
                                                --ָ����ת����
    int       bswap_byte      ( int value );                                [-1, +1, c]
    int       bswap_word      ( int value );                                [-1, +1, c]
    int       bswap_dword     ( int value );                                [-1, +1, c]
    int       bswap_qword     ( int value );                                [-1, +1, c]
]=======]
if string.unpack then

local function mkX( net, sign, size, lp, value )
  local fmt;
  if net then
    fmt = ">";
  else
    fmt = "<";
  end
  if sign then
    fmt = fmt .. "i";
  else
    fmt = fmt .. "I";
  end
  fmt = fmt .. size;
  
  if not value then
    return string.unpack( fmt, readmem( lp, size ) );
  end
  value = string.pack( fmt, value );
  return writemem( lp, value );
end

function mkb( lp, value )
  return mkX( false, true, 1, lp, value );
end

function mkB( lp, value )
  return mkX( false, false, 1, lp, value );
end

function mkbb( lp, value )
  return mkX( true, true, 1, lp, value );
end

function mkBB( lp, value )
  return mkX( true, false, 1, lp, value );
end

function mkw( lp, value )
  return mkX( false, true, 2, lp, value );
end

function mkW( lp, value )
  return mkX( false, false, 2, lp, value );
end

function mkww( lp, value )
  return mkX( true, true, 2, lp, value );
end

function mkWW( lp, value )
  return mkX( true, false, 2, lp, value );
end

function mkd( lp, value )
  return mkX( false, true, 4, lp, value );
end

function mkD( lp, value )
  return mkX( false, false, 4, lp, value );
end

function mkdd( lp, value )
  return mkX( true, true, 4, lp, value );
end

function mkDD( lp, value )
  return mkX( true, false, 4, lp, value );
end

function mkq( lp, value )
  return mkX( false, true, 8, lp, value );
end

function mkQ( lp, value )
  return mkX( false, false, 8, lp, value );
end

function mkqq( lp, value )
  return mkX( true, true, 8, lp, value );
end

function mkQQ( lp, value )
  return mkX( true, false, 8, lp, value );
end

function mkf( lp, value )
  if not value then
    return string.unpack( "<f", readmem( lp, string.packsize( "<f" ) ) );
  end
  value = string.pack( "<f", value );
  return writemem( lp, value );
end

function mkF( lp, value )
  if not value then
    return string.unpack( "<d", readmem( lp, string.packsize( "<d" ) ) );
  end
  value = string.pack( "<d", value );
  return writemem( lp, value );
end

function mkff( lp, value )
  if not value then
    return string.unpack( ">f", readmem( lp, string.packsize( ">f" ) ) );
  end
  value = string.pack( ">f", value );
  return writemem( lp, value );
end

function mkFF( lp, value )
  if not value then
    return string.unpack( ">d", readmem( lp, string.packsize( ">d" ) ) );
  end
  value = string.pack( ">d", value );
  return writemem( lp, value );
end


function bswap( value, size )
  local fmt = "=I";
  if size then
    fmt = fmt .. size;
  end
  local ss = string.pack( fmt, value ):reverse();
  return (string.unpack( fmt, ss ));
end

function bswap_byte( value )      return value;             end
function bswap_word( value )      return bswap( value, 2 ); end
function bswap_dword( value )     return bswap( value, 4 ); end
function bswap_qword( value )     return bswap( value, 8 ); end

end


--[=======[
��
    void*     hook            (
                              void*     hookmem,
                              int       hooksize,
                              string    data_descibe,
                              string    len_descibe,
                              bool      docodeend
                              );                                        [-5, +1, c|e|v]
        --Hook2Log ��ַ
    void*     hook            (
                              void*     hookmem,
                              string    data_descibe,
                              string    len_descibe,
                              bool      calltable_offset,
                              bool      docallend
                              );                                        [-5, +1, c|e|v]
        --Hook2Log ƫ�ƻ���ת��

    void      unhook          ( void*   node );                         [-1, +0, c|e|v]
        --��unhook����node����ʱ��ж��ȫ��hook
]=======]
function unhook( ... )          return hook( ... ); end