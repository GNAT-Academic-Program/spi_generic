with Spi_Control;
with Spi_Data;

package body Spi_Interface is

   --  Bind the driver primitives into the portable sub-generics.
   --  All sequencing logic lives in Spi_Control.
   --  All byte-loop policy lives in Spi_Data.

   package Control is new Spi_Control
     (Device         => Device_T,
      Driver_Init    => Driver_Init,
      Driver_Enable  => Driver_Enable,
      Driver_Disable => Driver_Disable,
      Driver_Reset   => Driver_Reset);

   package Data is new Spi_Data
     (Device          => Device_T,
      Driver_Transfer => Driver_Transfer);

   ------------
   -- Open   --
   ------------

   procedure Open (Dev : in out Device;
                   Cfg : Spi_Types.Spi_Config) is
   begin
      Control.Init  (Dev, Cfg);
      Control.Enable (Dev);
   end Open;

   -----------
   -- Close --
   -----------

   procedure Close (Dev : in out Device) is
   begin
      Control.Disable (Dev);
   end Close;

   -----------
   -- Reset --
   -----------

   procedure Reset (Dev : in out Device) is
   begin
      Control.Disable (Dev);
      Control.Reset (Dev);
   end Reset;


   -----------
   -- Write --
   -----------

   procedure Write (Dev     : in out Device;
                    Buf     : Storage_Array) is
   begin
      Data.Write (Dev, Buf);
   end Write;

   ----------
   -- Read --
   ----------

   procedure Read (Dev      : in out Device;
                   Buf      : out Storage_Array) is
   begin
      Data.Read (Dev, Buf);
   end Read;

end Spi_Interface;
