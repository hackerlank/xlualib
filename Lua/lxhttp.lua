--[=======[
-------- -------- -------- --------
             xhttp����
-------- -------- -------- --------
]=======]

--[=======[
��
    int response_code, table response_headers, string response_body
              xhttp                     (
                                        string url
                                        [,
                                        table options
                                        ]
                                        );
                                                                          [-1|2, +3, v]
        --����һ��http����
        --options������������²���(ע��Сд����)��
          {
          int       connect_time_out;             --���ӳ�ʱ������ƣ�Ĭ��20000
          int       time_out;                     --���ʳ�ʱ������ƣ�Ĭ��10000
          string    proxy;                        --����
                                                    ��������Ҳ�Ϊ��ʱ�����ô���
          string    data;                         --post����
                                                    �������ʱ��http����Ϊpost������Ĭ��Ϊget
          table     header;                       --����ͷ
          }
        --����ͷ����Ӧͷ����  [����] = ֵ  ��ʽ���

        ex:
          local c, h, b = xhttp("http://www.hj032.cn");
          for k, v in pairs(h) do
            xlog("key:" .. k, "value:" .. v);
          end

          local c, h, b = xhttp("http://www.xxxx.xx",
                                {
                                connect_time_out = 10000,
                                time_out = 500,
                                proxy = "127.0.0.1:8080",
                                data = "post data",
                                header =
                                  {
                                  xxx = "xxxx";
                                  }
                                }
                               );
]=======]