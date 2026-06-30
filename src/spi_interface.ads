with Spi_Types;
with System.Storage_Elements; use System.Storage_Elements;

--  SPI_Interface models a physical SPI bus (SPI1, SPI2, etc.).
--  The instantiation IS the bus. There is no Device_T.
--
--  Device-level abstractions (CS pin, chip config) belong in chip drivers
--  like NOR_Flash_Interface or W25Q128, not here.

generic
   with procedure Driver_Init     (Cfg : Spi_Types.Spi_Config);
   with procedure Driver_Enable;
   with procedure Driver_Disable;
   with procedure Driver_Reset;
   with procedure Driver_Transfer (TX  : Storage_Element;
                                   RX  : out Storage_Element);

package Spi_Interface is

   procedure Open  (Cfg : Spi_Types.Spi_Config);

   procedure Close;

   procedure Reset;

   procedure Write (Buf : Storage_Array);

   procedure Read  (Buf : out Storage_Array);

end Spi_Interface;
