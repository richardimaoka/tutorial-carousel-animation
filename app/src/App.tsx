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
    <div
      style={{
        width: "648px",
      }}
    >
      <CarouselContainer imagePathList={imagePathList} snappedIndex={snapped} />
      <div
        style={{
          display: "flex",
          justifyContent: "center",
          padding: "4px 0px",
        }}
      >
        {imagePathList.map((path, index) => (
          <button
            style={{
              margin: "0px 10px",
              width: "40px",
              height: "40px",
              borderRadius: "20px",
              borderWidth: "0px",
              color: "#ffffff",
              backgroundColor: index === snapped ? "#5955D9" : "#bcbbd8",
            }}
            key={path}
            onClick={() => setSnapped(index)}
          >
            {index + 1}
          </button>
        ))}
      </div>
    </div>
  );
};

const App = () => {
  return <CarouselControl />;
};

export default App;
