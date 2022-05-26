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
}

const CarouselContainer = ({ imagePathList }: CarouselContainerProps) => {
  return (
    <div
      style={{
        width: "648px",
        overflowX: "auto",
      }}
    >
      <div
        style={{
          display: "flex",
          flexDirection: "row",
          transition: "all 0.3s linear",
          transform: `translate(-1296px)`,
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
      <CarouselContainer imagePathList={imagePathList} />
      <button onClick={() => setSnapped(0)}>1</button>
      <button onClick={() => setSnapped(1)}>2</button>
      <button onClick={() => setSnapped(2)}>3</button>
      <span>snapped ={snapped + 1}</span>
    </div>
  );
};

const App = () => {
  return <CarouselControl />;
};

export default App;
