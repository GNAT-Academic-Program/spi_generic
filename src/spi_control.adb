package body Spi_Control is

   ----------
   -- Init --
   ----------

   procedure Init (Dev : in out Device; Cfg : Spi_Types.Spi_Config) is
   begin
      Driver_Init (Dev, Cfg);
   end Init;

   -----------
   -- Start --
   -----------

   procedure Enable (Dev : in out Device) is
   begin
      Driver_Enable (Dev);
   end Enable;

   ----------
   -- Stop --
   ----------

   procedure Disable (Dev : in out Device) is
   begin
      Driver_Disable (Dev);
   end Disable;

   -----------
   -- Reset --
   -----------

   procedure Reset (Dev : in out Device) is
   begin
      Driver_Reset (Dev);
   end Reset;

end Spi_Control;