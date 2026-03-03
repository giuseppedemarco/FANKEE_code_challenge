"use client";
import { FormEvent, useState } from "react";
import { Input } from "@/components/ui/input";
import { UserVerifyResponse } from "@/lib/models/users";
import styles from "./page.module.css";

export default function Username() {
  const [nickname, setNickname] = useState("");
  const [message, setMessage] = useState("");

  const onSubmit = async (e: FormEvent) => {
    e.preventDefault();
    setMessage("");

    if (!nickname.trim()) {
      setMessage("Please enter a username.");
      return;
    }

    try {
      const verifyRes = await fetch("/api/users?mode=verify", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nickname }),
      });

      if (!verifyRes.ok) {
        const verifyError = await verifyRes.json();
        setMessage(verifyError.detail ?? verifyError.error ?? "Error while verifying username.");
        return;
      }

      const verifyData = (await verifyRes.json()) as UserVerifyResponse;
      if (verifyData.exists) {
        setMessage("Nickname already exists. Please change it!");
        return;
      }

      const createRes = await fetch("/api/users", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ nickname, active: 1 }),
      });

      const createData = await createRes.json();
      if (!createRes.ok) {
        setMessage(createData.detail ?? createData.error ?? "Error while creating user.");
        return;
      }

      setMessage(`User created successfully: ${createData.nickname}`);
    } catch {
      setMessage("Network error while contacting the backend.");
    }
  };

  return (
    <main className="flex min-h-screen items-center justify-center">
      <div className="flex w-full max-w-2xl flex-col items-center gap-6 px-6">
        <p className="text-center text-4xl font-semibold text-[#FFE600]">What&apos;s your name?</p>
        <form onSubmit={onSubmit} className="flex w-full max-w-md items-center gap-3">
          <Input
            className="h-14 w-full border-2 border-[#FFE600] px-4 text-xl text-white placeholder:text-white/60 focus-visible:ring-[#FFE600]"
            placeholder="Username"
            value={nickname}
            onChange={(e) => setNickname(e.target.value)}
          />
          <button type="submit" className={styles.roundedRectangle} aria-label="Verify username" />
        </form>
        {message ? <p className="text-sm text-[#FFE600]">{message}</p> : null}
      </div>
    </main>
  );
}
