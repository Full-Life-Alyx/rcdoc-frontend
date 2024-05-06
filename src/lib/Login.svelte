<script lang="ts">
  import { api_loc } from "../constants";

  let res: string = "whomp";
  async function send_message() {
    const url = `${api_loc}/ping`;
    console.log(url);
    const responce = await fetch(url);
    res = await responce.text();
  }
</script>

<button on:click={send_message}>{res}</button>
