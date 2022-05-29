import React, { useState } from "react";

interface ImageState {
  imagePath: string;
  isSnapped: boolean;
}

interface CarouselItemProps {
  imagePath: string;
}

const CarouselItem = ({ imagePath }: CarouselItemProps) => {
  return (
    <div style={{ padding: "4px" }}>
      <img
        width="640px"
        height="360px"
        style={{ verticalAlign: "middle" }}
        src={imagePath}
      />
    </div>
  );
};

interface CarouselContainerProps {
  images: ImageState[];
}

const CarouselContainer = ({ images }: CarouselContainerProps) => {
  const snappedIndex = images.findIndex((image) => image.isSnapped);

  return (
    <div
      style={{
        overflowX: "hidden",
      }}
    >
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          transition: "all 0.3s linear",
          transform: `translate(${snappedIndex * -648}px)`,
        }}
      >
        {images.map((i) => (
          <CarouselItem key={i.imagePath} imagePath={i.imagePath} />
        ))}
      </div>
    </div>
  );
};

interface CarouselButtonsProps {
  images: ImageState[];
  onClick: (buttonIndex: number) => void;
}

const CarouselButtons = ({ images, onClick }: CarouselButtonsProps) => {
  const snappedIndex = images.findIndex((image) => image.isSnapped);

  const hasPrev = 0 < snappedIndex;
  const hasNext = snappedIndex < images.length - 1;

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "space-between",
        padding: "4px 0px",
      }}
    >
      <button
        style={{
          margin: "0px 10px",
          width: "40px",
          height: "40px",
          borderRadius: "20px",
          borderWidth: "0px",
          color: "#ffffff",
          backgroundColor: hasPrev ? "#5955D9" : "#bcbbd8",
        }}
        onClick={hasPrev ? () => onClick(snappedIndex - 1) : undefined}
      >
        &lt;
      </button>
      <button
        style={{
          margin: "0px 10px",
          width: "40px",
          height: "40px",
          borderRadius: "20px",
          borderWidth: "0px",
          color: "#ffffff",
          backgroundColor: hasNext ? "#5955D9" : "#bcbbd8",
        }}
        onClick={hasNext ? () => onClick(snappedIndex + 1) : undefined}
      >
        &gt;
      </button>
    </div>
  );
};

const CarouselControl = () => {
  const [images, setImages] = useState<ImageState[]>([
    {
      imagePath: "/images/1.png",
      isSnapped: true,
    },
    {
      imagePath: "/images/2.png",
      isSnapped: false,
    },
    {
      imagePath: "/images/3.png",
      isSnapped: false,
    },
  ]);
  const selectSnapped = (selectIndex: number) => {
    const updated: ImageState[] = images.map((state, index) => ({
      imagePath: state.imagePath,
      isSnapped: selectIndex === index,
    }));
    setImages(updated);
  };

  return (
    <div
      style={{
        width: "648px",
      }}
    >
      <CarouselContainer images={images} />
      <CarouselButtons
        images={images}
        onClick={(index) => {
          selectSnapped(index);
        }}
      />
    </div>
  );
};

const App = () => {
  return <CarouselControl />;
};

export default App;
