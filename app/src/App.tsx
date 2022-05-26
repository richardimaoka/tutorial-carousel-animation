import React, { useState } from "react";

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
  imagePathList: string[];
  snappedIndex: number;
}

const CarouselContainer = ({
  imagePathList,
  snappedIndex,
}: CarouselContainerProps) => {
  return (
    <div
      style={{
        width: "648px",
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
        {imagePathList.map((path) => (
          <CarouselItem key={path} imagePath={path} />
        ))}
      </div>
    </div>
  );
};

const CarouselControl = () => {
  const imagePathList = ["/images/1.png", "/images/2.png", "/images/3.png"];
  const [snapped, setSnapped] = useState(0);

  return (
    <div>
      <CarouselContainer imagePathList={imagePathList} snappedIndex={snapped} />
      <button onClick={() => setSnapped(0)}>1</button>
      <button onClick={() => setSnapped(1)}>2</button>
      <button onClick={() => setSnapped(2)}>3</button>
    </div>
  );
};

const App = () => {
  return <CarouselControl />;
};

export default App;
