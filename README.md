# spi_generic

Generic SPI abstraction layer for bare-metal Ada applications.

## Overview

`spi_generic` provides a hardware-independent SPI interface for embedded systems. It separates control and data operations through distinct generic packages, enabling flexible instantiation patterns for SPI master mode communication.

## Features

- Hardware-agnostic SPI abstraction
- Master mode support with configurable clock polarity and phase
- Separate control and data operation packages
- Combined interface package for convenience
- Support for 8-bit and 16-bit data frames
- Configurable bit order (MSB/LSB first)
- Zero runtime overhead through generic instantiation

## API

### SPI_Interface

```ada
generic
   type Device_T is limited private;
   with procedure Driver_Init (Dev : in out Device_T; Cfg : SPI_Types.SPI_Config);
   with procedure Driver_Enable (Dev : in out Device_T);
   with procedure Driver_Disable (Dev : in out Device_T);
   with procedure Driver_Transfer (Dev : in out Device_T; Tx_Data : MT.UInt8; Rx_Data : out MT.UInt8);
package SPI_Interface is
   subtype Device is Device_T;
   
   procedure Open (Dev : in out Device; Cfg : SPI_Types.SPI_Config);
   procedure Close (Dev : in out Device);
   procedure Transfer (Dev : in out Device; Tx_Buf : Storage_Array; Rx_Buf : out Storage_Array);
   procedure Write (Dev : in out Device; Buf : Storage_Array);
   procedure Read (Dev : in out Device; Buf : out Storage_Array);
end SPI_Interface;
```

## Usage

### 1. Implement Hardware Driver Layer

Create a hardware-specific package with device type and driver procedures.

### 2. Instantiate SPI_Interface

```ada
package SPI_Bus is new SPI_Interface
  (Device_T         => MCU_SPI.Device,
   Driver_Init      => MCU_SPI.Init,
   Driver_Enable    => MCU_SPI.Enable,
   Driver_Disable   => MCU_SPI.Disable,
   Driver_Transfer  => MCU_SPI.Transfer);
```

### 3. Use SPI

```ada
SPI_Bus.Open (SPI_Dev, (Mode => SPI_Types.Mode_0, Speed => SPI_Types.Speed_1MHz));
SPI_Bus.Write (SPI_Dev, Command_Bytes);
SPI_Bus.Read (SPI_Dev, Response_Bytes);
SPI_Bus.Close (SPI_Dev);
```

## Integration

Add to your `alire.toml`:

```toml
[[depends-on]]
spi_generic = "^0.1.0"
```

## Dependencies

- `machine_types` - Provides `MT.UInt8`, `MT.UInt16` types

## License

MIT OR Apache-2.0 WITH LLVM-exception
