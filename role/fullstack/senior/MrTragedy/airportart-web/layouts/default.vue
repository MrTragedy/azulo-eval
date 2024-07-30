<template>
  <AppNavbar />
  <div class="display-container">
    <div class="page-container">
      <slot></slot>
    </div>
  </div>
</template>

<style>

.display-container {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #ffffff;
  width: 100vw;
  margin: 0 auto;
  max-width: 1280px;
}

.page-container {
  box-sizing: border-box;
  max-width: 100%;
  min-height: 100vh;
}

@media (min-width: 240px) and (max-width: 480px) {
  .page-container {
    margin: 50px 20px;
  }
}

@media (min-width: 481px) and (max-width: 720px) {
  .page-container {
    margin: 120px 60px;
  }
}

@media (min-width: 721px) and (max-width: 1280px) {
  .page-container {
    margin: 200px 90px;
  }
}

@media (min-width: 1281px) {
  .page-container {
    margin: 0 auto;
    background-color: #ffffff;
    margin: 200px 90px;
  }
}
</style>
