with Spi_Types;

generic
   with procedure Driver_Init    (Cfg : Spi_Types.Spi_Config);
   with procedure Driver_Enable;
   with procedure Driver_Disable;
   with procedure Driver_Reset;
package Spi_Control is

   procedure Init    (Cfg : Spi_Types.Spi_Config);
   procedure Enable;
   procedure Disable;
   procedure Reset;

end Spi_Control;
