import React from "react";

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

function App() {
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
        }}
      >
        <CarouselItem imagePath="/images/1.png" />
        <CarouselItem imagePath="/images/2.png" />
        <CarouselItem imagePath="/images/3.png" />
      </div>
    </div>
  );
}

export default App;
