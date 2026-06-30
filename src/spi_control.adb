package body Spi_Control is

   ----------
   -- Init --
   ----------

   procedure Init (Cfg : Spi_Types.Spi_Config) is
   begin
      Driver_Init (Cfg);
   end Init;

   -----------
   -- Start --
   -----------

   procedure Enable is
   begin
      Driver_Enable;
   end Enable;

   ----------
   -- Stop --
   ----------

   procedure Disable is
   begin
      Driver_Disable;
   end Disable;

   -----------
   -- Reset --
   -----------

   procedure Reset is
   begin
      Driver_Reset;
   end Reset;

end Spi_Control;