--[=======[
-------- -------- -------- --------
              PE����
-------- -------- -------- --------
]=======]

--[=======[
��
    table     PE   ( HMOUDLE hmod = nullptr | string mod_name );          [-0|1, +1, c]
        --����
          {
          HMODULE                 hmod,
          const IMAGE_DOS_HEADER* dos_head,
          bool                    ispe,
          const IMAGE_NT_HEADERS* pe_head,
          void*                   entry,
          table                   image =
            {
            void*                 start,
            void*                 end,
            size_t                size,
            },
          table                   code =
            {
            void*                 start,
            void*                 end,
            size_t                size,
            },
          }
        --Lua5.3�����޷���ȷʹ�ô˺���
]=======]