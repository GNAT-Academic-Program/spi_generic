with Spi_Control;
with Spi_Data;

package body Spi_Interface is

   --  Bind the driver primitives into the portable sub-generics.
   --  All sequencing logic lives in Spi_Control.
   --  All byte-loop policy lives in Spi_Data.

   package Control is new Spi_Control
     (Driver_Init    => Driver_Init,
      Driver_Enable  => Driver_Enable,
      Driver_Disable => Driver_Disable,
      Driver_Reset   => Driver_Reset);

   package Data is new Spi_Data
     (Driver_Transfer => Driver_Transfer);

   ------------
   -- Open   --
   ------------

   procedure Open (Cfg : Spi_Types.Spi_Config) is
   begin
      Control.Init (Cfg);
      Control.Enable;
   end Open;

   -----------
   -- Close --
   -----------

   procedure Close is
   begin
      Control.Disable;
   end Close;

   -----------
   -- Reset --
   -----------

   procedure Reset is
   begin
      Control.Disable;
      Control.Reset;
   end Reset;


   -----------
   -- Write --
   -----------

   procedure Write (Buf : Storage_Array) is
   begin
      Data.Write (Buf);
   end Write;

   ----------
   -- Read --
   ----------

   procedure Read (Buf : out Storage_Array) is
   begin
      Data.Read (Buf);
   end Read;

end Spi_Interface;
