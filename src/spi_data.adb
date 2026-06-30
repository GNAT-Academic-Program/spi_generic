package body Spi_Data is

   -----------
   -- Write --
   -----------

   procedure Write (Buf : Storage_Array) is
      Dummy : Storage_Element := 0;
   begin
      for B of Buf loop
         Driver_Transfer (B, Dummy);
      end loop;
   end Write;

   ----------
   -- Read --
   ----------
   procedure Read (Buf : out Storage_Array) is
      Dummy_TX : constant Storage_Element := 16#FF#;
   begin
      for Idx in Buf'Range loop
         Driver_Transfer (Dummy_TX, Buf (Idx));
      end loop;
   end Read;

end Spi_Data;
